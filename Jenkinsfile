pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')  // Учетные данные DockerHub
        PYTHON_VERSION = "3.9"  // Версия Python
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm  // Клонирование репозитория
            }
        }

        stage('Set up Python') {
            steps {
                sh """
                    python${PYTHON_VERSION} -m venv venv
                    . venv/bin/activate
                    pip install --upgrade pip
                """
            }
        }

        stage('Install dependencies') {
            steps {
                sh """
                    . venv/bin/activate
                    if [ -f requirements.txt ]; then pip install -r requirements.txt; fi
                """
            }
        }

        stage('Lint with flake8') {
            steps {
                sh """
                    . venv/bin/activate
                    flake8 . --count --select=E9,F63,F7,F82 --show-source --statistics
                    flake8 . --count --exit-zero --max-complexity=10 --max-line-length=127 --statistics
                """
            }
        }

        stage('Test with pytest') {
            steps {
                sh """
                    . venv/bin/activate
                    pytest
                """
            }
        }

        stage('Build Docker image') {
            when {
                branch 'main'  // Сборка Docker-образа только для ветки main
            }
            steps {
                script {
                    // Генерация тегов для Docker-образа
                    def tags = []
                    if (env.BRANCH_NAME == 'main') {
                        tags.add("${env.DOCKERHUB_USERNAME}/ctr_project_inference:main")
                    }
                    if (env.TAG_NAME) {
                        tags.add("${env.DOCKERHUB_USERNAME}/ctr_project_inference:${env.TAG_NAME}")
                        tags.add("${env.DOCKERHUB_USERNAME}/ctr_project_inference:${env.TAG_NAME.split('\\.')[0]}.${env.TAG_NAME.split('\\.')[1]}")
                    }

                    // Сборка и публикация Docker-образа
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-credentials') {
                        def image = docker.build("${env.DOCKERHUB_USERNAME}/ctr_project_inference")
                        for (tag in tags) {
                            image.push(tag)
                        }
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs()  // Очистка рабочей директории
        }
    }
}
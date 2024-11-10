pipeline {
    agent any

    environment {
        CI = 'true'
    }
    stages {
        stage('Build') {
            steps {
                sh 'python -m pip install --upgrade pip & pip install -r requirements.txt'
                sh 'flake8 . --count --select=E9,F63,F7,F82 --show-source --statistics'
                sh 'flake8 . --count --exit-zero --max-complexity=10 --max-line-length=127 --statistics'
            }
        }
        stage('Test') {
            steps {
                sh 'pwd'
                sh 'pytest'
            }
        }
    }
}
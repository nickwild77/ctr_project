# Click-Through Rate (CTR) Prediction App

This project is a tool for analyzing and predicting Click-Through Rate (CTR), a metric widely used in digital marketing, advertising, and analytics.

It includes a set of tools for data processing, machine learning model development, and result visualization. The project is based on data from the Kaggle Avazu CTR Prediction competition.

## Key Features

- **Data preprocessing**: Cleaning and preparing data for analysis.
- **CTR analysis**: Exploring data and identifying the key factors that influence CTR.
- **Modeling**: Building and training machine learning models to predict CTR.
- **Visualization**: Generating charts and reports to present results clearly.
- **Integration**: Support for integration with external APIs and databases.

## Installation

### Clone the repository

```bash
git clone https://github.com/nickwild77/ctr_project.git
cd ctr_project
```

### Create and activate a virtual environment

```bash
python -m venv .venv
source .venv/bin/activate  # On Windows, use: .venv\Scripts\activate
```

### Install dependencies

```bash
pip install -r requirements.txt
```

## Usage

### Train the model

Run the following command to start the model training pipeline:

```bash
python train_pipeline.py --configs configs/train_config.yaml
```

### Run tests

Run the unit tests with:

```bash
pytest
```

## Project Structure

The project is organized as follows:

```text
ctr_project/
├── configs/                 # Configuration files
├── data/
│   ├── raw/                 # Raw data
│   └── processed/           # Processed data
├── models/                  # Saved models
├── notebooks/               # Jupyter notebooks
├── src/                     # Source code
│   ├── data/                # Data loading scripts
│   ├── features/            # Feature engineering scripts
│   ├── models/              # Model training and prediction scripts
│   └── visualization/       # Visualization scripts
├── tests/                   # Tests
├── Dockerfile               # Docker image definition
├── docker-compose.yml       # Docker Compose configuration
├── requirements.txt         # Python dependencies
└── README.md                # Project documentation
```

## Docker Image

Run the inference image with:

```bash
docker run -d nickwild77/ctr_project_inference:main
```


# Click-Through Rate (CTR) Prediction App

Проект представляет собой инструмент для анализа и прогнозирования Click-Through Rate (CTR) 
— показателя кликабельности, который широко используется в digital-маркетинге, рекламе и аналитике. 
Проект включает в себя набор инструментов для обработки данных, построения моделей машинного обучения и визуализации результатов. 
В качестве основы используются данные соревнования Kaggle Avazu CTR Prediction.

## Основные возможности

- **Предобработка данных**: Очистка и подготовка данных для анализа.
- **Анализ CTR**: Исследование данных и выявление ключевых факторов, влияющих на CTR.
- **Моделирование**: Построение и обучение моделей машинного обучения для прогнозирования CTR.
- **Визуализация**: Генерация графиков и отчетов для наглядного представления результатов.
- **Интеграция**: Поддержка интеграции с внешними API и базами данных.

## Установка
- Клонирование репозитория:

```
git clone https://github.com/nickwild77/ctr_project.git
cd ctr_project
```
- Создание и активация виртуального окружения:

```
python -m venv .venv
source .venv/bin/activate  # Для Windows используйте .venv\Scripts\activate
```
- Установка зависимостей:
```
pip install -r requirements.txt
```
## Использование

### Обучение модели:

- Для запуска процесса обучения модели выполните следующую команду:
```
python train_pipeline.py --configs configs/train_config.yaml
```
### Тестирование:

- Для запуска юнит-тестов используйте:
```
pytest
```

# Структура проекта
### Проект организован следующим образом:

```
ctr_project/
├── configs/                 # Конфигурационные файлы
├── data/
│   ├── raw/                 # Сырые данные
│   └── processed/           # Обработанные данные
├── models/                  # Сохраненные модели
├── notebooks/               # Jupyter ноутбуки
├── src/                     # Исходный код
│   ├── data/                # Скрипты для загрузки данных
│   ├── features/            # Скрипты для создания признаков
│   ├── models/              # Скрипты для обучения и предсказания моделей
│   └── visualization/       # Скрипты для визуализации
├── tests/                   # Тесты
├── Dockerfile               # Docker файл для контейнеризации
├── docker-compose.yml       # Docker Compose файл
├── requirements.txt         # Файл зависимостей
└── README.md                # Описание проекта
```
###  Docker image: 
```
docker run -d nickwild77/ctr_project_inference:main
```

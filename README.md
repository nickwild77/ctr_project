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

#Структура проекта
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
###Docker image: 
`docker pull nickwild77/ctr_project_inference:main`

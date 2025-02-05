Click-Through Rate (CTR) Prediction App

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

Project Organization
------------

    ├── LICENSE
    ├── Makefile           <- Makefile with commands like `make data` or `make train`
    ├── README.md          <- The top-level README for developers using this project.
    ├── data
    │   ├── external       <- Data from third party sources.
    │   ├── interim        <- Intermediate data that has been transformed.
    │   ├── processed      <- The final, canonical data sets for modeling.
    │   └── raw            <- The original, immutable data dump.
    │
    ├── docs               <- A default Sphinx project; see sphinx-doc.org for details
    │
    ├── models             <- Trained and serialized models, model predictions, or model summaries
    │
    ├── notebooks          <- Jupyter notebooks. Naming convention is a number (for ordering),
    │                         the creator's initials, and a short `-` delimited description, e.g.
    │                         `1.0-jqp-initial-data-exploration`.
    │
    ├── references         <- Data dictionaries, manuals, and all other explanatory materials.
    │
    ├── reports            <- Generated analysis as HTML, PDF, LaTeX, etc.
    │   └── figures        <- Generated graphics and figures to be used in reporting
    │
    ├── requirements.txt   <- The requirements file for reproducing the analysis environment, e.g.
    │                         generated with `pip freeze > requirements.txt`
    │
    ├── setup.py           <- makes project pip installable (pip install -e .) so src can be imported
    ├── src                <- Source code for use in this project.
    │   ├── __init__.py    <- Makes src a Python module
    │   │
    │   ├── data           <- Scripts to download or generate data
    │   │   └── make_dataset.py
    │   │
    │   ├── features       <- Scripts to turn raw data into features for modeling
    │   │   └── build_features.py
    │   │
    │   ├── models         <- Scripts to train models and then use trained models to make
    │   │   │                 predictions
    │   │   ├── predict_model.py
    │   │   └── train_model.py
    │   │
    │   └── visualization  <- Scripts to create exploratory and results oriented visualizations
    │       └── visualize.py
    │
    └── tox.ini            <- tox file with settings for running tox; see tox.readthedocs.io


--------


###Pull docker image: `docker pull nickwild77/ctr_project_inference:v1`
###Docker hub: https://hub.docker.com/repository/docker/nickwild77/ctr_project_inference

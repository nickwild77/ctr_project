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

import logging
import os
import sys
from time import sleep
import pathlib
import numpy as np
import requests

from src.data.make_dataset import read_data
from src.entities.train_pipeline_params import (
    TrainingPipelineParams,
    read_training_pipeline_params,
)

logger = logging.getLogger(__name__)
handler = logging.StreamHandler(sys.stdout)
logger.setLevel(logging.INFO)
logger.addHandler(handler)

if __name__ == "__main__":
    home_dir = pathlib.Path.home()
    config_path = str(home_dir / "ctr_project" / "configs" / "train_config.yaml")
    training_pipeline_params: TrainingPipelineParams = read_training_pipeline_params(
        config_path
    )

    data = read_data(training_pipeline_params.input_preprocessed_data_path)

    for i in range(10):
        request_data = [
            x.item() if isinstance(x, np.generic) else x for x in data.iloc[i].tolist()
        ]
        logger.info(f"check request_data: {request_data}")
        logger.info(f"check data.columns: {list(data.columns)}")

        response = requests.post(
            "http://0.0.0.0:8000/predict/",
            json={"data": [request_data], "features": list(data.columns)},
        )

        logger.info(f"check response.status_code: {response.status_code}")
        logger.info(f"check response.json(): {response.json()}\n")

        sleep(1)

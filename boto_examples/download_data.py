import os
import boto3
from dotenv import load_dotenv


def download_data():
    load_dotenv()
    aws_access_key_id = os.environ.get('aws_access_key_id')
    aws_secret_access_key = os.environ.get('aws_secret_access_key')

    session = boto3.session.Session()
    s3_client = session.client(
        service_name='s3',
        region_name='ru-central1',
        aws_access_key_id=aws_access_key_id,
        aws_secret_access_key=aws_secret_access_key,
        endpoint_url='https://storage.yandexcloud.net',
    )

    s3_client.download_file(
        'ctr-project',
        'data/sampled_train_50k.csv',
        '/opt/airflow/dags/data/s3/sampled_train_50k.csv',
    )

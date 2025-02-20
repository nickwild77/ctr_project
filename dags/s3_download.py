from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from airflow.utils.dates import days_ago

from boto_examples.download_data import download_data

with DAG(
        dag_id="ctr_download_data_from_s3",
        start_date=days_ago(5),
        schedule_interval="@weekly",
) as dag:
    download_from_s3 = PythonOperator(
        task_id='data-download-from-s3',
        python_callable=download_data,
        dag=dag
    )

    download_from_s3

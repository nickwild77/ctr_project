from airflow import DAG
from airflow.operators.python_operator import PythonOperator

from boto_examples import download_data

with DAG(
        dag_id="download_data_from_s3",
        start_date=airflow.utils.dates.days_ago(5),
        schedule_interval="@weekly",
) as dag:
    download_from_s3 = PythonOperator(
        task_id='Data download from s3',
        python_callable=download_data,
        dag=dag
    )

    download_from_s3

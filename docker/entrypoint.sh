#!/bin/bash

function init_airflow {
    export AIRFLOW__CORE__DAGS_FOLDER=/dev/null
    airflow db init
    /bin/bash $AIRFLOW_HOME/init-connections.sh
    airflow users create -r Admin -u airflow -p airflow -e airflow@airflow.com -f airflow -l airflow
    unset AIRFLOW__CORE__DAGS_FOLDER
}

case "$1" in
  run-airflow)
    init_airflow
    airflow scheduler & airflow webserver -p 8080
    ;;
esac
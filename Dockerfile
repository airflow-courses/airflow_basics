FROM apache/airflow:2.1.0-python3.8

ENV AIRFLOW_HOME=/usr/local/airflow

COPY --chown=airflow docker/entrypoint.sh $AIRFLOW_HOME/entrypoint.sh
COPY --chown=airflow docker/airflow.cfg $AIRFLOW_HOME/airflow.cfg
COPY --chown=airflow docker/init-connections.sh $AIRFLOW_HOME/init-connections.sh

EXPOSE 8080 5555

USER airflow

WORKDIR $AIRFLOW_HOME
ENTRYPOINT ["/bin/bash", "./entrypoint.sh"]
CMD ["run-airflow"]
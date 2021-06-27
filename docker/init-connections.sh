#!/bin/bash

airflow connections add --conn-uri 'postgres://airflow:airflow@staging:5432' staging
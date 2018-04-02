#!/usr/bin/env bash

until cd backend
do
    echo "Waiting for django volume"
done

until python manage.py migrate --settings=project_name.settings.docker
do
    echo "Waiting for postgres..."
    sleep 2
done

python manage.py runserver 0.0.0.0:8000 --settings=project_name.settings.docker

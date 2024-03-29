#!/bin/sh

python3 manage.py makemigrations
if [ $? -ne 0 ]; then
    echo "Error: makemigrations failed"
    exit 1
else
    python3 manage.py migrate
    echo "Application has started."
    python3 manage.py runserver 0.0.0.0:8000
    python manage.py collectstatic --noinput
fi
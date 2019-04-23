#!/bin/sh

ADDRESS="${ADDRESS:-0.0.0.0}"
PORT="${PORT:-8000}"

python manage.py migrate
python manage.py runserver $ADDRESS:$PORT


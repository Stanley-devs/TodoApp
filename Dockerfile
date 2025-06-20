FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

COPY TodoApp/requirements.txt /app/
RUN pip install --upgrade pip && pip install -r requirements.txt

COPY ../.. /app/

CMD ["gunicorn", "TodoApp.wsgi:application", "--bind", "0.0.0.0:8000"]
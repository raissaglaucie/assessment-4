FROM --platform=linux/amd64  python:3.12-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --upgrade pip && pip install -r requirements.txt

COPY . /app

EXPOSE 8080

CMD ["gunicorn", "--config", "gunicorn_config.py", "--log-level", "debug", "app:app"]

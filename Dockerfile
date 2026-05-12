FROM python:3.11-slim

WORKDIR /application

COPY app/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

RUN apt-get update && apt-get install -y curl

RUN useradd -m appuser

COPY . .

RUN chown -R appuser:appuser /application

USER appuser

EXPOSE 5000

HEALTHCHECK CMD curl --fail http://localhost:5000/health || exit 1

CMD ["python3", "app/app.py"]
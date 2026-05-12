FROM python:3.11-slim

WORKDIR /application

COPY app/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["python3", "app/app.py"]
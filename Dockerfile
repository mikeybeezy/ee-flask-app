FROM python:3.11

WORKDIR /app

COPY app.py .

COPY requirements.txt .

RUN pip install -r requirements.txt

CMD ["python", "./app.py"]
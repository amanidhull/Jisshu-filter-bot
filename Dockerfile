FROM python:3.12-slim
WORKDIR /Jisshubot
RUN apt-get update && \
    apt-get install --no-install-recommends -y git gcc libjpeg-dev zlib1g-dev && \
    rm -rf /var/lib/apt/lists/*
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip -r requirements.txt --root-user-action=ignore
COPY . .
EXPOSE 8080
CMD ["python", "bot.py"]

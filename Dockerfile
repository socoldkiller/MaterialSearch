# 本Dockerfile构建对应的参数为：
# MODEL_NAME = "OFA-Sys/chinese-clip-vit-base-patch16"
FROM python:3.11
WORKDIR /app/
ENV HF_HOME=/app/
ENV TRANSFORMERS_OFFLINE=0

RUN apt update &&  \
    apt install -y ffmpeg  && \
    apt install git-lfs && \
    git lfs install && \
    apt clean

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt &&  \
    git clone https://huggingface.co/OFA-Sys/chinese-clip-vit-base-patch16

COPY *.py ./
COPY static/ ./static/


CMD python3 main.py
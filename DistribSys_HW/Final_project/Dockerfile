FROM ubuntu:latest

WORKDIR /root/DisSys_proj


RUN apt update && apt upgrade -y && apt install -y vim build-essential python3 python3-dev wget && \
    wget https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    wget https://dlcdn.apache.org/spark/spark-3.2.1/spark-3.2.1-bin-hadoop3.2.tgz && \
    tar -xvf spark-3.2.1-bin-hadoop3.2.tgz -C /usr/local && \
    mv /usr/local/spark-3.2.1-bin-hadoop3.2 /usr/local/spark
COPY spark_install.sh .


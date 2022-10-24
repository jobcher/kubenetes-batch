FROM ubuntu:20.04
LABEL version="v1.0"
LABEL maintainer="nb@nbtyfood.com"
LABEL description="this is hadoop images"

# 安装java
RUN sudo apt-get update && sudo apt install openjdk-8-jdk -y

# 下载解压
RUN mkdir /input && \
    cd /input && \
    wget https://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-3.3.4/hadoop-3.3.4.tar.gz && \
    tar -zxvf hadoop-3.3.4.tar.gz

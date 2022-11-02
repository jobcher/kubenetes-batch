FROM ubuntu:20.04
LABEL version="v1.0"
LABEL maintainer="nb@nbtyfood.com"
LABEL description="this is hadoop images"

USER root
# 安装java
RUN sudo apt install openjdk-8-jdk -y

# 下载解压
RUN mkdir /input && \
    cd /input && \
    wget https://archive.apache.org/dist/hadoop/common/hadoop-3.3.0/hadoop-3.3.0.tar.gz && \
    tar -zxvf hadoop-3.3.4.tar.gz
# 配置
RUN export JAVA_HOME=/usr/java/latest

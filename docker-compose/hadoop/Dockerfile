FROM centos:centos7.9.2009
LABEL version="v1.0"
LABEL maintainer="nb@nbtyfood.com"
LABEL description="this is hadoop images"

USER root
# 安装java
RUN mkdir -p /export/server
ADD jdk-8u152-linux-x64.tar.gz /export/server

# 下载解压
ADD https://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-3.3.1/hadoop-3.3.1.tar.gz /export/server
# 配置
ENV JAVA_HOME=/export/server/jdk-8u152
ENV PATH=$PATH:$JAVA_HOME/bin:$HADOOP_HOME/bin:$HADOOP_HOME/sbin
ENV CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV HDFS_NAMENODE_USER=root HDFS_DATANODE_USER=root HDFS_SECONDARYNAMENODE_USER=root YARN_RESOURCEMANAGER_USER=root YARN_NODEMANAGER_USER=root
ENV HADOOP_HOME=/export/server/hadoop-3.3.1
EXPOSE 9870 8088
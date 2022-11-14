FROM centos:centos7.9.2009
LABEL maintainer="jobcher"

USER root
# 切换工作目录
WORKDIR /opt/hdp
# 安装java
ADD jdk-8u152-linux-x64.tar.gz ./
ADD hadoop-3.3.1.tar.gz ./
# 安装 ssh 服务
RUN yum clean all && yum makecache
RUN yum install -y openssh-server openssh-clients rsync vim\
        && ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N "" -q \
        && ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N "" -q \
        && ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N "" -q \
        && groupadd hadoop \
        && useradd hdfs -g hadoop \
        && echo "root:root" | chpasswd \
        && echo "hdfs:hdfs" | chpasswd \
        && mkdir /var/run/sshd \
        && mkdir /opt/hdp/tmp \
        && chown -R hdfs:hadoop /opt/hdp \
        && mv hadoop-3.3.1 hadoop \
        && mv jdk1.8.0_152 jdk
EXPOSE 22 9870 8088 50070
# 预定持久化文件的目录
VOLUME /opt/hdp/tmp
# 运行 ssh 服务
CMD ["/usr/sbin/sshd","-D"]
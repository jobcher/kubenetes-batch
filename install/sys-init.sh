#!/bin/bash
#系统初始化
printf "#######################开始设置环境##################################### \n"
echo "127.0.0.1   $(hostname)" >> /etc/hosts
printf "##################正在配置所有基础环境信息################## \n"

printf "##################停止当前防火墙服务################## \n"
systemctl stop firewalld.service
systemctl disable firewalld.service
firewall-cmd --state

printf "##################关闭selinux################## \n"
sed -i 's/enforcing/disabled/' /etc/selinux/config
setenforce 0

printf "##################加载模块################## \n"
modprobe br_netfilter
lsmod | grep br_netfilter

printf "##################新建k8s.conf文件################## \n"
cat <<EOF >  /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

printf "##################修改的桥接网络设置################## \n"
sysctl -p /etc/sysctl.d/k8s.conf
ls /proc/sys/net/bridge

printf "##################配置apt源################## \n"
deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse

printf "##################添加国内源################## \n"
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

cat <<EOF >/etc/apt/sources.list.d/docker.list
deb [arch=armhf] https://download.docker.com/linux/raspbian buster stable
EOF

apt-get update

printf "##################添加kubernetes国内源################## \n"
apt-get update && apt-get install -y apt-transport-https

curl https://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg | apt-key add -

cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-xenial main
EOF

apt-get update

printf "##################安装软件################## \n"
apt-get -y install docker-ce
apt-get -y install kubectl-1.23.8.00 kubelet-1.23.8.00 kubeadm-1.23.8.00

printf "##################配置docker参数################## \n"
cat > /etc/docker/daemon.json <<EOF
{
  "registry-mirrors": ["https://gtit7jpb.mirror.aliyuncs.com"],
  "exec-opts": ["native.cgroupdriver=systemd"],
  "graph": ["/var/lib/docker"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF

systemctl daemon-reload
systemctl restart docker

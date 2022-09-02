#!/bin/bash
#系统初始化
printf "#######################开始设置环境##################################### \n"
echo "127.0.0.1   $(hostname)" >> /etc/hosts
printf "##################正在配置所有基础环境信息################## \n"
apt install net-tools

printf "##################关闭selinux################## \n"
sed -i 's/enforcing/disabled/' /etc/selinux/config
setenforce 0

printf "##################关闭swapc################## \n"
swapoff -a  
sed -ri 's/.*swap.*/#&/' /etc/fstab 

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
curl -sSL https://get.daocloud.io/docker | sh
apt-get -y install kubectl=1.23.8-00 kubelet=1.23.8-00 kubeadm=1.23.8-00

printf "##################配置docker参数################## \n"
cat > /etc/docker/daemon.json <<EOF
{
    "exec-opts": ["native.cgroupdriver=systemd"]
}
EOF


cat > /var/lib/kubelet/config.yaml <<EOF
apiVersion: kubelet.config.k8s.io/v1beta1
kind: KubeletConfiguration
cgroupDriver: systemd
EOF

systemctl daemon-reload
systemctl restart docker
systemctl restart kubelet
#!/bin/bash
#系统初始化
# 修改机器名
hostnamectl set-hostname $1
# 设置 hostname 解析
echo "127.0.0.1   $(hostname)" >> /etc/hosts
printf "##################正在配置所有基础环境信息################## \n"

printf "##################停止当前防火墙服务################## \n"
systemctl stop firewalld.service
systemctl disable firewalld.service
firewall-cmd --state

printf "##################关闭selinux################## \n"
sed -i 's/enforcing/disabled/' /etc/selinux/config
setenforce 0
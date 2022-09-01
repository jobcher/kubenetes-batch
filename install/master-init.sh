#!/bin/bash
#初始化master节点
kubeadm init \
--control-plane-endpoint "10.12.12.19:6443" \
--upload-certs \
--pod-network-cidr=10.18.0.0/16 \
--image-repository registry.cn-hangzhou.aliyuncs.com/google_containers
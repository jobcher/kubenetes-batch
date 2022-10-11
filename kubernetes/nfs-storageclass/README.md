# 使用NFS配置StatefulSet的动态持久化存储

## 安装NFS服务端
```sh
sudo apt update
sudo apt install nfs-kernel-server nfs-common
```
## 安装NFS客户端
所有的节点都得执行
>sudo apt install nfs-common -y

## 创建目录
```sh
mkdir -p /data/storage/k8s/rocketmq
```
使用NFS作为`StatefulSet`持久化存储的操作记录，分别需要创建`nfs-provisioner`的`rbac`、`storageclass`、`nfs-client-provisioner`和`statefulset`的`pod`  
## 创建nfs的rbac  

>kubectl apply -f nfs-rbac.yaml

## 创建rocketmq集群的storageclass  
>kubectl apply -f rocketmq-nfs-class.yaml  
>kubectl get sc -n sanjiang

## 创建rocketmq集群的nfs-client-provisioner  
`PROVISIONER_NAME`的值一定要和`StorageClass`中的`provisioner`相等  
>kubectl apply -f rocketmq-nfs.yml  

#!/bin/bash
#docker-compose 生成配置文件

mkdir -p /rocketmq/data/namesv1
mkdir -p /rocketmq/logs/namesv1
mkdir -p /rocketmq/data/namesv2
mkdir -p /rocketmq/logs/namesv2
mkdir -p /rocketmq/config/broker-a
mkdir -p /rocketmq/data/broker-a
mkdir -p /rocketmq/logs/broker-a
mkdir -p /rocketmq/config/broker-a-s
mkdir -p /rocketmq/data/broker-a-s
mkdir -p /rocketmq/logs/broker-a-s
mkdir -p /rocketmq/config/broker-b
mkdir -p /rocketmq/data/broker-b
mkdir -p /rocketmq/logs/broker-b
mkdir -p /rocketmq/config/broker-b-s
mkdir -p /rocketmq/data/broker-b-s
mkdir -p /rocketmq/logs/broker-b-s
mkdir -p /rocketmq/config/broker-c
mkdir -p /rocketmq/data/broker-c
mkdir -p /rocketmq/logs/broker-c
mkdir -p /rocketmq/config/broker-c-s
mkdir -p /rocketmq/data/broker-c-s
mkdir -p /rocketmq/logs/broker-c-s
mkdir -p /rocketmq/config/broker-d
mkdir -p /rocketmq/data/broker-d
mkdir -p /rocketmq/logs/broker-d
mkdir -p /rocketmq/config/broker-d-s
mkdir -p /rocketmq/data/broker-d-s
mkdir -p /rocketmq/logs/broker-d-s
cd /rocketmq/config/broker-a
cat > broker-a.conf <<EOF
#集群名称
brokerClusterName=DefaultCluster
#broker名称
brokerName=broker-a
#brokerId master用0 slave用其他
brokerId=0
#清理时机
deleteWhen=4
#文件保留时长 48小时
fileReservedTime=48
#broker角色 -ASYNC_MASTER异步复制 -SYNC_MASTER同步双写 -SLAVE
brokerRole=SYNC_MASTER
#刷盘策略 - ASYNC_FLUSH 异步刷盘 - SYNC_FLUSH 同步刷盘
flushDiskType=SYNC_FLUSH
#主机ip
brokerIP1=193.0.40.172
#对外服务的监听接口，同一台机器上部署多个broker,端口号要不相同
listenPort=10911
#namesvr
namesrvAddr=193.0.40.172:9876;193.0.40.172:9877
#是否能够自动创建topic
autoCreateTopicEnable=true
EOF
# 生成配置文件
cd /rocketmq/config/broker-a-s
cat > broker-a-s.conf <<EOF
#集群名称
brokerClusterName=DefaultCluster
#broker名称
brokerName=broker-a
#brokerId master用0 slave用其他
brokerId=1
#清理时机
deleteWhen=4
#文件保留时长 48小时
fileReservedTime=48
#broker角色 -ASYNC_MASTER异步复制 -SYNC_MASTER同步双写 -SLAVE
brokerRole=SLAVE
#刷盘策略 - ASYNC_FLUSH 异步刷盘 - SYNC_FLUSH 同步刷盘
flushDiskType=SYNC_FLUSH
#主机ip
brokerIP1=193.0.40.172
#对外服务的监听接口，同一台机器上部署多个broker,端口号要不相同
listenPort=11911
#namesrv
namesrvAddr=193.0.40.172:9876;193.0.40.172:9877
#是否能够自动创建topic
autoCreateTopicEnable=true
EOF
cd /rocketmq/config/broker-b
cat > broker-b.conf <<EOF
#集群名称
brokerClusterName=DefaultCluster
#broker名称
brokerName=broker-b
#brokerId master用0 slave用其他
brokerId=0
#清理时机
deleteWhen=4
#文件保留时长 48小时
fileReservedTime=48
#broker角色 -ASYNC_MASTER异步复制 -SYNC_MASTER同步双写 -SLAVE
brokerRole=SYNC_MASTER
#刷盘策略 - ASYNC_FLUSH 异步刷盘 - SYNC_FLUSH 同步刷盘
flushDiskType=SYNC_FLUSH
#主机ip
brokerIP1=193.0.40.172
#对外服务的监听接口，同一台机器上部署多个broker,端口号要不相同
listenPort=12911
#namesrv
namesrvAddr=193.0.40.172:9876;193.0.40.172:9877
#是否能够自动创建topic
autoCreateTopicEnable=true
EOF
cd /rocketmq/config/broker-b-s
cat > broker-b-s.conf <<EOF
#集群名称
brokerClusterName=DefaultCluster
#broker名称
brokerName=broker-b
#brokerId master用0 slave用其他
brokerId=1
#清理时机
deleteWhen=4
#文件保留时长 48小时
fileReservedTime=48
#broker角色 -ASYNC_MASTER异步复制 -SYNC_MASTER同步双写 -SLAVE
brokerRole=SLAVE
#刷盘策略 - ASYNC_FLUSH 异步刷盘 - SYNC_FLUSH 同步刷盘
flushDiskType=SYNC_FLUSH
#主机ip
brokerIP1=193.0.40.172
#对外服务的监听接口，同一台机器上部署多个broker,端口号要不相同
listenPort=13911
#namesrv
namesrvAddr=193.0.40.172:9876;193.0.40.172:9877
#是否能够自动创建topic
autoCreateTopicEnable=true
EOF
cd /rocketmq/config/broker-c
cat > broker-c.conf <<EOF
#集群名称
brokerClusterName=DefaultCluster
#broker名称
brokerName=broker-c
#brokerId master用0 slave用其他
brokerId=0
#清理时机
deleteWhen=4
#文件保留时长 48小时
fileReservedTime=48
#broker角色 -ASYNC_MASTER异步复制 -SYNC_MASTER同步双写 -SLAVE
brokerRole=SYNC_MASTER
#刷盘策略 - ASYNC_FLUSH 异步刷盘 - SYNC_FLUSH 同步刷盘
flushDiskType=SYNC_FLUSH
#主机ip
brokerIP1=193.0.40.172
#对外服务的监听接口，同一台机器上部署多个broker,端口号要不相同
listenPort=14911
#namesrv
namesrvAddr=193.0.40.172:9876;193.0.40.172:9877
#是否能够自动创建topic
autoCreateTopicEnable=true
EOF
cd /rocketmq/config/broker-c-s
cat > broker-c-s.conf <<EOF
#集群名称
brokerClusterName=DefaultCluster
#broker名称
brokerName=broker-c
#brokerId master用0 slave用其他
brokerId=1
#清理时机
deleteWhen=4
#文件保留时长 48小时
fileReservedTime=48
#broker角色 -ASYNC_MASTER异步复制 -SYNC_MASTER同步双写 -SLAVE
brokerRole=SLAVE
#刷盘策略 - ASYNC_FLUSH 异步刷盘 - SYNC_FLUSH 同步刷盘
flushDiskType=SYNC_FLUSH
#主机ip
brokerIP1=193.0.40.172
#对外服务的监听接口，同一台机器上部署多个broker,端口号要不相同
listenPort=15911
#namesrv
namesrvAddr=193.0.40.172:9876;193.0.40.172:9877
#是否能够自动创建topic
autoCreateTopicEnable=true
EOF
cd /rocketmq/config/broker-d
cat > broker-d.conf <<EOF
#集群名称
brokerClusterName=DefaultCluster
#broker名称
brokerName=broker-d
#brokerId master用0 slave用其他
brokerId=0
#清理时机
deleteWhen=4
#文件保留时长 48小时
fileReservedTime=48
#broker角色 -ASYNC_MASTER异步复制 -SYNC_MASTER同步双写 -SLAVE
brokerRole=SYNC_MASTER
#刷盘策略 - ASYNC_FLUSH 异步刷盘 - SYNC_FLUSH 同步刷盘
flushDiskType=SYNC_FLUSH
#主机ip
brokerIP1=193.0.40.172
#对外服务的监听接口，同一台机器上部署多个broker,端口号要不相同
listenPort=16911
#namesrv
namesrvAddr=193.0.40.172:9876;193.0.40.172:9877
#是否能够自动创建topic
autoCreateTopicEnable=true
EOF
cd /rocketmq/config/broker-d-s
cat > broker-d-s.conf <<EOF
#集群名称
brokerClusterName=DefaultCluster
#broker名称
brokerName=broker-d
#brokerId master用0 slave用其他
brokerId=1
#清理时机
deleteWhen=4
#文件保留时长 48小时
fileReservedTime=48
#broker角色 -ASYNC_MASTER异步复制 -SYNC_MASTER同步双写 -SLAVE
brokerRole=SLAVE
#刷盘策略 - ASYNC_FLUSH 异步刷盘 - SYNC_FLUSH 同步刷盘
flushDiskType=SYNC_FLUSH
#主机ip
brokerIP1=193.0.40.172
#对外服务的监听接口，同一台机器上部署多个broker,端口号要不相同
listenPort=17911
#namesrv
namesrvAddr=193.0.40.172:9876;193.0.40.172:9877
#是否能够自动创建topic
autoCreateTopicEnable=true
EOF
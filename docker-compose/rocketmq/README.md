# rocketMQ 集群
- [返回目录](../../README.md)  
V 4.8.0  
采用`4主4从`，`同步模式`。HA实现上采用`Master/Slave+Failover`组件方式
每台主机运行`三个容器`，分别为`NameServer`、`BrokerMaster`、`SlaveMaster`，每个Master和Slave分别存放在不同的机器上
  
## 架构
![架构](/statics/images/rocketmq.png)
  

|IP|角色|服务|
|:----|:----|:----|
|193.0.40.172|NameServer|-|
|193.0.40.172|BrokerMaster|broker-a|
|193.0.40.172|SlaveMaster|broker-d-s|
|193.0.40.172|BrokerMaster|broker-b|
|193.0.40.172|SlaveMaster|broker-a-s|
|193.0.40.172|BrokerMaster|broker-c|
|193.0.40.172|SlaveMaster|broker-b-s|
|193.0.40.172|BrokerMaster|broker-d|
|193.0.40.172|SlaveMaster|broker-c-s|

## docker-compse部署
```sh
#安装dokcker-compose
sudo ./install/docker-compose.sh
```

```sh
# 生成配置文件
git pull
sudo ./docker/rocketmq/rocket-config.sh
# 运行docker-compose部署
cd ./docker/rocketmq/ && sudo docker-compose up -d
# 判断部署是否成功
docker ps -a
```

# k8s 部署
[rocketMQ k8s集群](./kubenetes/rocketmq/README.md)
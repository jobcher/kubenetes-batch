## 监控面板部署
- 主机 监控
- ikuai 监控
- 群晖 监控

## docker安装
```sh
# 脚本安装
curl -sSL https://get.daocloud.io/docker | sh
# docker-compose 安装 v2.2.2可自己编写
sudo curl -L "https://github.com/docker/compose/releases/download/v2.2.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#可执行权限
sudo chmod +x /usr/local/bin/docker-compose
#创建软链：
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
#测试是否安装成功
docker-compose --version
```

## 创建目录
```sh
# 创建目录
mkdir -p ./grafana
chmod +777 -R grafana/
```
## 运行docker-compose
>docker-compose up -d

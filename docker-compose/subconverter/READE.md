# subconverter 订阅转换
基于 tindy2013/subconverter 项目的 docker 镜像.仅修改 分组配置文件 以解决以下问题.  
- 增加Netflix，DisneyPlus等分组.
- 去除自动选择 url-test以解决连接数爆涨问题.
- 修改时区 镜像默认时区为 Asia/Shanghai

## Dockerfile编译
```sh
docker build -t sjtfreaks/subconverter .
docker push sjtfreaks/subconverter:latest
```

## docker-compose发布
```sh
docker-compose up -d
```
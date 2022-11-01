# Nexus 私有库部署
[github 仓库](https://github.com/sonatype/nexus-public)
[docker 仓库](https://hub.docker.com/r/sonatype/nexus3)
## 部署
```sh
mkdir -p /data/nexus
chmod +777 -R /data/nexus
#运行docker-compose
docker-compose up -d
```
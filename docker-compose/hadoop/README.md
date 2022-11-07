# Hadoop
## 架构
如下图所示，`Hadoop`的`master`和`slave`分别运行在不同的Docker容器中，其中`hadoop-master`容器中运行`NameNode`和`ResourceManager`，`hadoop-slave`容器中运行`DataNode`和`NodeManager`。`NameNode`和`DataNode`是Hadoop分布式文件系统`HDFS`的组件，负责储存输入以及输出数据，而`ResourceManager`和`NodeManager`是Hadoop集群资源管理系统`YARN`的组件，负责`CPU和内存资源的调度`。  
![hadoop](/images/hadoop.drawio.svg)  
  
### 组件区分
|Hadoop节点|HDFS组件|YARN组件|
|:----|:----|:----|
|hadoop-master|NameNode|ResourceManager|
|hadoop-slave|DataNode|NodeManager|

## 下载地址
```sh
wget -c https://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-3.3.1/hadoop-3.3.1.tar.gz
wget -c https://repo.huaweicloud.com/java/jdk/8u152-b16/jdk-8u152-linux-x64.tar.gz
```
# Hadoop + Hive + Spark 集群构建
## 架构
如下图所示，`Hadoop`的`master`和`slave`分别运行在不同的Docker容器中，其中`hadoop-master`容器中运行`NameNode`和`ResourceManager`，`hadoop-slave`容器中运行`DataNode`和`NodeManager`。`NameNode`和`DataNode`是Hadoop分布式文件系统`HDFS`的组件，负责储存输入以及输出数据，而`ResourceManager`和`NodeManager`是Hadoop集群资源管理系统`YARN`的组件，负责`CPU和内存资源的调度`。  
![hadoop](/images/hadoop.drawio.svg)  
  
### 组件区分
|Hadoop节点|HDFS组件|YARN组件|
|:----|:----|:----|
|hadoop-master|NameNode|ResourceManager|
|hadoop-slave|DataNode|NodeManager|

## 创建外部存储
```sh
~/docker/spark/share
# 创建文件
mv words.txt ~/docker/spark/share
```

## 创建镜像
```sh
# 编译
docker build -t sjtfreaks/hadoop:3 .
# 运行
docker-compose -f docker-compose-hadoop.yaml up -d
```

## 进入容器配置
```sh
docker exec -ti hadoop-spark-1 bash
./start-hadoop.sh
```

```sh
# HDFS 写入文件
hadoop fs -put /opt/share/words.txt /
hdfs dfs -ls /
```


```sh
# 访问HDFS
pyspark
>>> lines = sc.textFile('hdfs://master:9000/words.txt')
>>> lines.collect()
>>> words = lines.flatMap(lambda x: x.split(' '))
>>> words.saveAsTextFile('hdfs://master:9000/split-words.txt')
```

```sh
# 存储
hdfs dfs -ls /
hdfs dfs -ls /split-words.txt
hdfs dfs -ls /split-words.txt/part-00000
```

```sh
# spark应用提交到 YARN 集群
spark-submit --master yarn \
--deploy-mode cluster \
--name "Word Count" \
--executor-memory 1g \
--class org.apache.spark.examples.JavaWordCount \
/opt/bitnami/spark/examples/jars/spark-examples_2.12-3.1.2.jar /words.txt
```

## 端口访问
> 193.0.40.173:8080 SPARK
> 193.0.40.173:9870 HDFS
> 193.0.40.173:8088 YARN
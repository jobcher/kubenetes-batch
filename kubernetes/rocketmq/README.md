# rocketMQ k8s集群
- [返回目录](/README.md)  
V 4.8.0  
采用`4主4从`，`同步模式`。在k8s运行过程中需要提供持久化，因此使用StatefulSet管理有状态应用额的工作负载对象。使用NFS作为持久化存储  
- 给定 `Pod` 的存储必须由 `PersistentVolume` 驱动 基于所请求的 `storage class` 来提供，或者由管理员预先提供。
- 删除或者扩缩 `StatefulSe`t 并不会删除它关联的存储卷。 这样做是为了保证数据安全，它通常比自动清除 `StatefulSet` 所有相关的资源更有价值。
- `StatefulSet` 当前需要无头服务 来负责 Pod 的网络标识。你需要负责创建此服务。
- 当删除一个 `StatefulSet` 时，该 `StatefulSet` 不提供`任何终止` Pod 的保证。 为了实现 `StatefulSet` 中的 `Pod` 可以有序且体面地终止，可以在删除之前将 StatefulSet `缩容到 0`。
- 在默认` Pod 管理策略`(`OrderedReady`) 时使用 `滚动更新`，可能进入需要`人工干预` 才能修复的损坏状态。
  
  
## NFS (`StoreClass`) k8s持久化存储 部署
`nfs` 卷能将 `NFS` (网络文件系统) 挂载到你的 `Pod` 中。 不像 `emptyDir` 那样会在删除 `Pod` 的同时也会被删除，`nfs` 卷的内容在删除 `Pod` 时会被保存，卷只是被卸载。 这意味着 `nfs` 卷可以被预先填充数据，并且这些数据可以在 `Pod` 之间共享。  
  

## k8s 部署
生成文件
```sh
kubectl create cm rocketmq-config --from-file=broker-a.properties --from-file=broker-a-s.properties --from-file=broker-b.properties --from-file=broker-b-s.properties --from-file=broker-c.properties --from-file=broker-c-s.properties --from-file=broker-d.properties --from-file=broker-d-s.properties -n sanjiang
```
>kubectl get cm -n sanjiang|grep rocketmq
### 部署服务
```sh
cd ./kubenetes/rocketmq \
&& kubectl apply -f .
```

### 删除服务
```sh
cd ./kubenetes/rocketmq \
&& kubectl delete -f .
```

## docker-compse部署
[rocketMQ docker集群](./docker/rocketmq/README.md)
创建 SkyWalking Agent 配置
```sh
kubectl create configmap skywalking-agent-config --from-file=skywalking-agent/ --namespace dev-center
```
修改应用的 Deployment 配置
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-java-app
  namespace: dev-center
spec:
  replicas: 1
  template:
    metadata:
      labels:
        app: my-java-app
    spec:
      containers:
      - name: my-java-app
        image: my-java-app-image
        env:
        - name: SW_AGENT_NAME
          value: "my-java-app"
        - name: SW_AGENT_COLLECTOR_BACKEND_SERVICES
          value: "skywalking-oap:11800"  # SkyWalking OAP 服务地址
        volumeMounts:
        - name: skywalking-agent-config
          mountPath: /skywalking-agent
          subPath: skywalking-agent
      volumes:
      - name: skywalking-agent-config
        configMap:
          name: skywalking-agent-config

```
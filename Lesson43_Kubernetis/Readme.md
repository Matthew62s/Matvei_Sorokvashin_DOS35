## Установка и настройка kubernetes на примере minikube
Установим CLI для управления кластерами kubernetes
```
curl -LO https://dl.k8s.io/release/`curl -LS https://dl.k8s.io/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version --client
Client Version: v1.37.0
Kustomize Version: v5.8.1
Server Version: v1.35.1
Warning: version difference between client (1.37) and server (1.35) exceeds the supported minor version skew of +/-1
```
Установим minikube для воспроизведения локального кластера
```
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
  && chmod +x minikube
sudo mkdir -p /usr/local/bin/
sudo install minikube /usr/local/bin/
```
Запустим minikube с драйвером docker(docker должен присутствовать в системе)
```
minikube start --vm-driver=docker
minikube status
type: Control Plane
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured
```
В отдельном окне терминала запустим ui для minikube
```minikube dashboard```

## Запуск тестового приложения через minikube
Запустим тестовый образ контейнера с веб сервером
```kubectl create deployment hello-node --image=registry.k8s.io/e2e-test-images/agnhost:2.53 -- /agnhost netexec --http-port=8080```
```kubectl get deployments
NAME         READY   UP-TO-DATE   AVAILABLE   AGE
hello-node   1/1     1            1           27s
```
```kubectl get pods
NAME                         READY   STATUS    RESTARTS   AGE
hello-node-64fc5894d-xkpk4   1/1     Running   0          73s
```
```
kubectl get events
LAST SEEN   TYPE     REASON              OBJECT                            MESSAGE
3m17s       Normal   Scheduled           pod/hello-node-64fc5894d-xkpk4    Successfully assigned default/hello-node-64fc5894d-xkpk4 to minikube
3m16s       Normal   Pulling             pod/hello-node-64fc5894d-xkpk4    Pulling image "registry.k8s.io/e2e-test-images/agnhost:2.53"
3m13s       Normal   Pulled              pod/hello-node-64fc5894d-xkpk4    Successfully pulled image "registry.k8s.io/e2e-test-images/agnhost:2.53" in 3.538s (3.538s including waiting). Image size: 139374622 bytes.
3m12s       Normal   Created             pod/hello-node-64fc5894d-xkpk4    Container created
3m12s       Normal   Started             pod/hello-node-64fc5894d-xkpk4    Container started
3m17s       Normal   SuccessfulCreate    replicaset/hello-node-64fc5894d   Created pod: hello-node-64fc5894d-xkpk4
3m17s       Normal   ScalingReplicaSet   deployment/hello-node             Scaled up replica set hello-node-64fc5894d from 0 to 1
root@ip-172-31-39-216:/opt/Matvei_Sorokvashin_DOS35/Lesson43_Kubernetis# kubectl config view
apiVersion: v1
clusters:
- cluster:
    certificate-authority: /root/.minikube/ca.crt
    extensions:
    - extension:
        last-update: Wed, 26 Aug 2026 23:15:12 UTC
        provider: minikube.sigs.k8s.io
        version: v1.38.1
      name: cluster_info
    server: https://192.168.49.2:8443
  name: minikube
contexts:
- context:
    cluster: minikube
    extensions:
    - extension:
        last-update: Wed, 26 Aug 2026 23:15:12 UTC
        provider: minikube.sigs.k8s.io
        version: v1.38.1
      name: context_info
    namespace: default
    user: minikube
  name: minikube
current-context: minikube
kind: Config
users:
- name: minikube
  user:
    client-certificate: /root/.minikube/profiles/minikube/client.crt
    client-key: /root/.minikube/profiles/minikube/client.key
```
Сделаем доступным для публичного интернета
```
kubectl expose deployment hello-node --type=LoadBalancer --port=8080
```
```
kubectl get services
NAME         TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
hello-node   LoadBalancer   10.111.97.234   <pending>     8080:31734/TCP   4m12s
kubernetes   ClusterIP      10.96.0.1       <none>        443/TCP          142m
minikube service hello-node
┌───────────┬────────────┬─────────────┬───────────────────────────┐
│ NAMESPACE │    NAME    │ TARGET PORT │            URL            │
├───────────┼────────────┼─────────────┼───────────────────────────┤
│ default   │ hello-node │ 8080        │ http://192.168.49.2:31734 │
└───────────┴────────────┴─────────────┴───────────────────────────┘
🎉  Opening service default/hello-node in default browser...
👉  http://192.168.49.2:31734
```

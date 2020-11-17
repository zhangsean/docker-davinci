# k8s-descheduler-mirror

Mirror of `k8s.gcr.io/descheduler/descheduler`.

gcr.io | docker hub
---|---
k8s.gcr.io/descheduler/descheduler:v0.19.0 | [zhangsean/descheduler:v0.19.0](https://hub.docker.com/r/zhangsean/descheduler/)

## Usage

```sh
# Deploy using helm
helm repo add descheduler https://kubernetes-sigs.github.io/descheduler/
helm install descheduler --namespace kube-system descheduler/descheduler-helm-chart --image.repository zhangsean/descheduler
# Deploy using yaml, Run As A CronJob
kubectl create -f https://github.com/kubernetes-sigs/descheduler/raw/master/kubernetes/base/rbac.yaml
kubectl create -f https://github.com/kubernetes-sigs/descheduler/raw/master/kubernetes/base/configmap.yaml
curl -sSL https://github.com/kubernetes-sigs/descheduler/raw/master/kubernetes/cronjob/cronjob.yaml | sed 's|k8s.gcr.io/descheduler|zhangsean|g' | kubectl create -f -
```

## More info

[kubernetes-sigs/descheduler](https://github.com/kubernetes-sigs/descheduler)

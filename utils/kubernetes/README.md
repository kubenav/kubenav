# Kubernetes

To deploy kubenav to your Kubernetes cluster, you can simply run the following commands:

```sh
kubectl apply -f https://raw.githubusercontent.com/kubenav/kubenav/master/utils/kubernetes/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/kubenav/kubenav/master/utils/kubernetes/serviceaccount.yaml
kubectl apply -f https://raw.githubusercontent.com/kubenav/kubenav/master/utils/kubernetes/clusterrole.yaml
kubectl apply -f https://raw.githubusercontent.com/kubenav/kubenav/master/utils/kubernetes/clusterrolebinding.yaml
kubectl apply -f https://raw.githubusercontent.com/kubenav/kubenav/master/utils/kubernetes/deployment.yaml
kubectl apply -f https://raw.githubusercontent.com/kubenav/kubenav/master/utils/kubernetes/service.yaml
```

This will deploy kubenav with the `--incluster` flag, which enables the in cluster mode of kubenav, where only the cluster where kubenav is running is available via the dashboard. To access the dashboard you can create an Ingress or you can use the created service:

```sh
kubectl port-forward --namespace kubenav svc/kubenav 14122
```

It is also possible to use the kubenav server with multiple Kubernetes cluster. For this you have to create a [secret](./secret.yaml) with your base64 encoded Kubeconfig file. Then you mount your Kubeconfig file and set the path via the `--kubeconfig` flag:

```yaml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: kubenav
  namespace: kubenav
  labels:
    app: kubenav
spec:
  replicas: 1
  selector:
    matchLabels:
      app: kubenav
  template:
    metadata:
      labels:
        app: kubenav
    spec:
      serviceAccountName: kubenav
      containers:
        - name: kubenav
          image: kubenav/kubenav:0742c773
          imagePullPolicy: IfNotPresent
          args:
             - --kubeconfig=/kubenav/kubeconfig/kubeconfig
          ports:
            - name: http
              containerPort: 14122
              protocol: TCP
          livenessProbe:
            httpGet:
              path: /api/health
              port: http
          readinessProbe:
            httpGet:
              path: /api/health
              port: http
          resources:
            limits:
              cpu: 100m
              memory: 128Mi
            requests:
              cpu: 50m
              memory: 64Mi
          # Mount the Kubeconfig file from your secret to the kubenav container.
          volumeMounts:
            - name: kubeconfig
              mountPath: '/kubenav/kubeconfig'
              readOnly: true
      # Define a new volume, to use the kubeconfig secret containing your Kubeconfig file. This is only required, if you
      # do not want to use the in cluster option.
      # volumes:
        - name: kubeconfig
          secret:
            secretName: kubeconfig
```

All available Docker images for kubenav can be found at Docker Hub: [kubenav/kubenav](https://hub.docker.com/r/kubenav/kubenav)





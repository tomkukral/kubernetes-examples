# Example application for Docker & Kubernetes


## Applications

Directory | Application
----------|-----------------------------
app_v1    | The simplest Docker application
app_v2    | Simple application with some tuning (better build, `.dockerignore`)
app_v3    | App with redis deployed by docker-compose
app_v4    | App with redis deployed in Kubernetes (in single pod, emptyDir storage)
app_v5    | App with redis deployed in Kubernetes (redis in second pod)
app_v6    | App demonstrating configuration options
app_v7    | App probes, resource limits, horizontal pod autoscaler
app_v8    | Security contexts, network policies


## Kubernetes manifests

* `affinities/non-master.yml` Run nginx deployment on non-master nodes (minions)

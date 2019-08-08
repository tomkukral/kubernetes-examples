#!/bin/bash

set -xe

kubectl apply -f crd.yml
kubectl apply -f lab.yml

export OWNER_UID=$(kubectl get -f lab.yml -o json | jq -r .metadata.uid)

envsubst < resources.yml | kubectl apply -f -

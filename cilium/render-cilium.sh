#!/bin/bash

helm template --dry-run --values values.yml --namespace kube-system cilium/cilium

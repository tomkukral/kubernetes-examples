#!/bin/bash

helm template --dry-run --values values.yml --namespace kube-system --version 1.14.2 cilium/cilium

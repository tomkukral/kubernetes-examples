#!/bin/bash

for i in {0..2}; do 
	helm template \
	--dry-run --values values.yml \
	--set cluster.name="c${i}" \
	--set cluster.id="1${i}" \
	--set ipam.operator.clusterPoolIPv4PodCIDRList=10.${i}.0.0/17 \
	--namespace kube-system --version 1.14.2 cilium/cilium > rendered-c${i}.yml
done

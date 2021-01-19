#!/bin/bash -e

cd kubernetes-mixin/
jb install
make clean prometheus_alerts.yaml prometheus_rules.yaml dashboards_out
cd ..

rm -rf rendered
mkdir -p rendered/dashboards
cp kubernetes-mixin/prometheus_alerts.yaml rendered/
cp kubernetes-mixin/prometheus_rules.yaml rendered/

for i in $(find kubernetes-mixin/dashboards_out -type f); do 
	bn="rendered/dashboards/$(basename $i)"
	echo "Processing key $i to $bn"
	cat $i | jq -c > $bn
done

tree rendered

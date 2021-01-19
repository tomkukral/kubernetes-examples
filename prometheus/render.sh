#!/bin/bash -e

cd kubernetes-mixin/
jb install
make clean prometheus_alerts.yaml prometheus_rules.yaml dashboards_out
cd ..

rm -rf rendered
mkdir -p rendered
mv kubernetes-mixin/prometheus_alerts.yaml rendered/
mv kubernetes-mixin/prometheus_rules.yaml rendered/
cp -vr kubernetes-mixin/dashboards_out/ rendered/dashboards

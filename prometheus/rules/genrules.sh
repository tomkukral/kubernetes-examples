#!/bin/bash
echo "apiVersion: v1
kind: ConfigMap
metadata:
  name: prometheus-rules
  namespace: prometheus
data:
"
for i in $(ls *.yml); do 
	echo "  ${i}: |-"; 
	cat "${i}" | sed 's/^/    /'
done

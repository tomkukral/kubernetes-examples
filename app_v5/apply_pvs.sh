#!/bin/bash
for i in {0..10}; do
	cat pv.yml | sed "s/-0/-$i/g" | kubectl apply -f -
done

#!/bin/bash
size="1GB"
zone="europe-west1-b"
for i in {0..10}; do
	gcloud compute disks create --size "$size" --zone "$zone" "disk-$i"
done

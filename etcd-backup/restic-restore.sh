#!/bin/bash

export RESTIC_REPOSITORY="s3:http://minio.c0.k8s.6shore.net/etcd-backup"
export AWS_ACCESS_KEY_ID=glass
export AWS_SECRET_ACCESS_KEY=paper123
export RESTIC_PASSWORD=zuTeizaeng4Quuaheereofoh2yae5mael1aci3ieFuZaece0ezae7eePhoo4Iepi

restic cat config || exit 1
restic snapshots

restic ls latest

restic restore latest --target /tmp/etcd-backup --path /data 


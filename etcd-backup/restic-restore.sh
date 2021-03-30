#!/bin/bash -e

export RESTIC_REPOSITORY="s3:http://$(dig +short @10.96.0.10 minio.minio.svc.cluster.local)/etcd-backup"
export AWS_ACCESS_KEY_ID=glass
export AWS_SECRET_ACCESS_KEY=paper123
export RESTIC_PASSWORD=zuTeizaeng4Quuaheereofoh2yae5mael1aci3ieFuZaece0ezae7eePhoo4Iepi

restic cat config
restic snapshots

restic ls latest

restic restore latest --target /tmp/etcd-backup --path /data 


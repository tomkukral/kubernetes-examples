#!/bin/bash -e

export RESTIC_REPOSITORY="s3:http://$(dig +short @10.96.0.10 minio.minio.svc.cluster.local)/etcd-backup"
export AWS_ACCESS_KEY_ID=$(kubectl -n default get secret credentials -o json | jq -r .data.obj_username | base64 -d)
export AWS_SECRET_ACCESS_KEY=$(kubectl -n default get secret credentials -o json | jq -r .data.obj_password | base64 -d)
export RESTIC_PASSWORD=$(kubectl -n default get secret credentials -o json | jq -r .data.restic_password | base64 -d)

restic cat config
restic snapshots

restic ls latest

restic restore latest --target /tmp/etcd-backup --path /data 


#!/bin/bash

helm template aws-ebs-csi-driver --namespace kube-system --include-crds --no-hooks aws-ebs-csi-driver/aws-ebs-csi-driver | tee deploy.yml

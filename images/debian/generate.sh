#!/bin/bash
set -e

# configuration
version="jessie"
mirror="http://ftp.sh.cvut.cz/debian/"
name="registry.in.fit.cvut.cz:443/ict/debian:$version"
name_latest="registry.in.fit.cvut.cz:443/ict/debian:latest"
dir="debootstrap-debian-$version"

# debootstrap directory
sudo /usr/sbin/debootstrap "$version" "$dir" "$mirror"

sudo chown -R gitlab-runner "$dir"

# import images
tar -C "$dir" -c . | docker import - "$name"

docker tag -f "$name" "$name_latest"

# push images
docker push "$name"
docker push "$name_latest"

echo "image: $name"

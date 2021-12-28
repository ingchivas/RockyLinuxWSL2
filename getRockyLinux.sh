#!/bin/bash

docker run -d --name rocky-wsl rockylinux/rockylinux:latest
docker export rocky-wsl -o rootfs.tar

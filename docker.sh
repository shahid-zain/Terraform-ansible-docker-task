#! /bin/bash

sudo ansible-playbook /tmp/docker.yaml
docker built -t joomla:v1 /tmp/Dockerfile

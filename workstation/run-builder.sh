#!/bin/bash
MY_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"
MY_DIR="$(dirname $MY_PATH)"
REPO_DIR="$(dirname $MY_DIR)"
cd $REPO_DIR

echo "REPO_DIR=${REPO_DIR}"

docker run -it --rm --privileged \
  -v ${REPO_DIR}:/usr/libbpfflow.git \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /sys/kernel/debug:/sys/kernel/debug \
  -v /lib/modules:/lib/modules:ro \
  -v /etc/localtime:/etc/localtime:ro \
  -v /snap/bin/microk8s.ctr:/snap/bin/microk8s.ctr \
  ebpflib-workstation
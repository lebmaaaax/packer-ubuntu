#!/usr/bin/env bash
set -euxo pipefail

export DEBIAN_FRONTEND=noninteractive

apt-get install -y cloud-init
systemctl enable cloud-init.service

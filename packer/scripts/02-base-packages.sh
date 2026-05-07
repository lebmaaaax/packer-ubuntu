#!/usr/bin/env bash
set -euxo pipefail

export DEBIAN_FRONTEND=noninteractive

apt-get install -y \
  ca-certificates \
  git \
  curl \
  jq \
  less \
  unzip

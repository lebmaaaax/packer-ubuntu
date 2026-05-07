#!/usr/bin/env bash
set -euxo pipefail

command -v curl
command -v jq
command -v cloud-init
systemctl is-enabled cloud-init.service
systemctl is-enabled ufw.service
sshd -t
test -f /etc/systemd/journald.conf.d/99-baseline.conf

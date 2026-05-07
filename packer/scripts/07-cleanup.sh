#!/usr/bin/env bash
set -euxo pipefail

cloud-init clean --logs || true
truncate -s 0 /etc/machine-id
rm -f /var/lib/dbus/machine-id
ln -s /etc/machine-id /var/lib/dbus/machine-id

apt-get autoremove -y
apt-get clean
rm -rf /var/lib/apt/lists/*
rm -rf /tmp/*
rm -rf /var/tmp/*
rm -f /root/.bash_history
rm -f /home/packer/.bash_history

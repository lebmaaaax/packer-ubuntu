#!/usr/bin/env bash
set -euxo pipefail

mkdir -p /etc/systemd/journald.conf.d

cat >/etc/systemd/journald.conf.d/99-baseline.conf <<'EOF'
[Journal]
Storage=persistent
SystemMaxUse=256M
RuntimeMaxUse=64M
Compress=yes
EOF

systemctl restart systemd-journald

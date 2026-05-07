#!/usr/bin/env bash
set -euxo pipefail

cat >/etc/ssh/sshd_config.d/buildup.conf <<'EOF'
PasswordAuthentication no
PermitRootLogin no
X11Forwarding no
ClientAliveInterval 300
ClientAliveCountMax 2
MaxAuthTries 3
EOF

sshd -t
systemctl restart ssh

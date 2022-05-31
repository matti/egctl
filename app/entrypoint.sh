#!/usr/bin/env bash
set -euo pipefail

EGCTL_IP=$1
EGCTL_STATES=${*:2}

echo "default ${EGCTL_PROTOCOL:-pms21} $EGCTL_IP ${EGCTL_PORT:-5000} ${EGCTL_PASSWORD:-1}" > /etc/egtab

exec egctl default $EGCTL_STATES
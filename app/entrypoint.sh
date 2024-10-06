#!/usr/bin/env bash
set -eEuo pipefail

EGCTL_IP=$1
EGCTL_STATES=${*:2}

echo "default ${EGCTL_PROTOCOL:-pms21} $EGCTL_IP ${EGCTL_PORT:-5000} ${EGCTL_PASSWORD:-1}" > /etc/egtab

if [[ "${EGCTL_LOOP:-}" == "yes" ]]; then
  while true
  do
    egctl default $EGCTL_STATES || echo "egctl failed"
    sleep "${EGCTL_INTERVAL:-5}"
  done
else
  exec egctl default $EGCTL_STATES
fi

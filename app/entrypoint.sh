#!/usr/bin/env bash
set -eEuo pipefail

if [[ -z "$EGCTL_IP" ]]; then
  EGCTL_IP=$1
fi

if [[ -z "$EGCTL_STATES" ]]; then
  EGCTL_STATES=${*:2}
fi

if [[ -z "$EGCTL_SILENT" ]]; then
  stream=/dev/null
else
  stream=/dev/stdout
fi

echo "default ${EGCTL_PROTOCOL:-pms21} $EGCTL_IP ${EGCTL_PORT:-5000} ${EGCTL_PASSWORD:-1}" > /etc/egtab

if [[ "${EGCTL_LOOP:-}" == "yes" ]]; then
  while true
  do
    >"$stream" 2>&1 echo "$(date) - setting states ${EGCTL_STATES}"
    >"$stream" 2>&1 egctl default $EGCTL_STATES || echo "egctl failed"
    sleep "${EGCTL_INTERVAL:-5}"
  done
else
  exec egctl default $EGCTL_STATES
fi

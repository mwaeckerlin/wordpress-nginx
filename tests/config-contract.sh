#!/usr/bin/env bash
# Config contract: the image forwards PHP to the php-fpm service of its examples.
#
# Usage: tests/config-contract.sh IMAGE

set -uo pipefail

IMAGE="${1:?usage: tests/config-contract.sh IMAGE}"

echo "==> Config contract: ${IMAGE}"
if docker image inspect --format '{{json .Config.Env}}' "${IMAGE}" | grep -q '"PHP_FPM_HOST=wordpress-php-fpm"'; then
    echo "  PASS  php_fpm_host_default"
else
    echo "  FAIL  php_fpm_host_default: $(docker image inspect --format '{{json .Config.Env}}' "${IMAGE}")"
    exit 1
fi

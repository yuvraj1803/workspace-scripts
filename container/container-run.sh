#!/usr/bin/env bash
set -e

CONTAINER="workspace-dev"

if [ $# -lt 1 ]; then
echo "usage: $0 <script> [args...]"
exit 1
fi

SCRIPT="$1"
shift

START=$(date +%s)

container exec $CONTAINER /bin/bash -c "$SCRIPT $*"

END=$(date +%s)
ELAPSED=$((END - START))

echo ""
echo "execution time: ${ELAPSED}s"


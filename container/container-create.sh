#!/usr/bin/env bash
set -e

CONTAINER_NAME=workspace-dev
IMAGE_NAME=workspace-dev-img

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "Workspace: $WORKSPACE_DIR"

# build image if missing
if ! container image inspect $IMAGE_NAME >/dev/null 2>&1; then
    echo "Building container image..."
    container build -t $IMAGE_NAME -f "$SCRIPT_DIR/Containerfile" "$SCRIPT_DIR"
fi

# start container if not running
if ! container ps | grep -q $CONTAINER_NAME; then
    if container ps -a | grep -q $CONTAINER_NAME; then
        echo "Starting existing container..."
        container start $CONTAINER_NAME
    else
        echo "Creating new container..."

        container run -d \
            --name $CONTAINER_NAME \
            --mount type=bind,src="$WORKSPACE_DIR",dst=/workspace \
            --mount type=volume,dst=/ccache \
            $IMAGE_NAME \
            sleep infinity
    fi
fi

echo "Attaching shell..."
container exec -it $CONTAINER_NAME bash

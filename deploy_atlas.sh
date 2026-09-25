#!/bin/bash

set -euo pipefail

SERVICE="atlas.service"
ATLAS_DIR="/home/bethel/Atlas-Platform1"
HEALTH_URL="http://127.0.0.1"


atlas_app() {

    cd "$ATLAS_DIR"

    echo "Pulling latest code..."
    git pull

    echo "Restarting $SERVICE..."
    sudo systemctl restart "$SERVICE"

    echo "checking git..."
    git status
     
    echo "Checking service..."

    if systemctl is-active --quiet "$SERVICE"; 
    then
        echo "$SERVICE is active"
    else
        echo "$SERVICE is dead"
    fi

    echo "Checking application health..."
    if curl -fsS --max-time 5 http://127.0.0.1/5000 > /dev/null;
    then
        echo "Atlas application is healthy"
    else
        echo "Atlas application health check failed"
        echo $?
    fi
}

atlas_app 
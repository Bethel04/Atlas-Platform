#!/bin/bash

set -euo pipefail

SERVICE="atlas.service"
ATLAS_DIR="/home/bethel/Atlas-Platform1"
URL="http://127.0.0.1:5000"

atlas_app() {
    cd "$ATLAS_DIR"

    echo "Pulling latest code..."
    git pull

    echo "Restarting SERVICE..."
    sudo systemctl restart "$SERVICE"
     
    echo "Checking service..."

       if systemctl is-active --quiet "$SERVICE"; 
       then
           echo "$SERVICE is running"
    else
        echo "$SERVICE is dead"
    fi

    echo "checking services..."

     for service in nginx, ssh
    do 
      echo "Checking $service"
    done

    echo "Running Atlas health Checking..." 

    python3 healthcheck.py

    if [ $? -ne 0 ]; then
      echo "Atlas health check failed."
      exit 1
    fi
    echo "Atlas deployment successful."
}
atlas_app 
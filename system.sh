#!/bin/bash
set -euo pipefail

check_service() {
    
service=$1

if systemctl is-active --quiet $service;
then
    echo "$service is running"
else
    echo "$service is not running" 
fi

for service in nginx
do
  echo "$service is running"
done
}

check_service ssh
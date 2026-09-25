#!/bin/bash

set -euo pipefail

check_nginx() {
    if systemctl is-active --quiet "nginx";
    then
       echo "nginx is running"
    else
       echo "nginx is dead"
    fi
}

check_postgresql() {
    echo "checking postgresql..."
systemctl is-active   postgresql;
}

check_nginx
check_postgresql
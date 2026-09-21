#!/bin/bash

check_nginx() {
echo "Checking nginx..."
systemctl is-active  nginx;
}

check_postgresql() {
    echo "checking postgresql..."
systemctl is-active   postgresql;
}

check_nginx
check_postgresql
#!/bin/bash

echo "===== Atlas Health Check ====="
echo "Time: $(date)"

if curl -fsS --max-time 5 http://127.0.0.1/ > /dev/null; then
    echo "Atlas: UP"
else
    echo "Atlas: DOWN"
fi

echo

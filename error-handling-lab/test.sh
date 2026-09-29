#!/bin/bash

echo "Starting test..."

ls /this-directory-does-not-exist

if [ $? -ne 0 ]; then
    echo "ALERT: Atlas command failed."

    curl -X POST \
      -H "Content-Type: text/plain" \
      -d "ALERT: Atlas command failed." \
      http://127.0.0.1:8000

    exit 1
fi

echo "Test completed."
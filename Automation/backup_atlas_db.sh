#!/bin/bash

set -euo pipefail

BACKUP_DIR="$HOME/Atlas-Platform1/backups"
DATABASE="atlas_notes"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/${DATABASE}_${TIMESTAMP}.sql.gz"
SERVICE="atlas.service"
ATLAS_DIR="/home/bethel/Atlas-Platform1"


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

    echo "Atlas health Checking..." 

    if python3 "$ATLAS_DIR/health.py"; 
    then
      echo "Atlas health successful."
     else
      echo "Atlas health check failed." 
      exit 1
    fi

    echo "Database Checking..."

    if sudo -u postgres pg_dump "$DATABASE" | gzip > "$BACKUP_FILE"; then
       echo "Backup successful: $BACKUP_FILE"
       else
    ERROR_MESSAGE="Atlas database backup failed: $(date '+%Y-%m-%d %H:%M:%S')"

        echo "$ERROR_MESSAGE" | tee -a "$BACKUP_DIR/backup_errors.log" >&2

    SLACK_WEBHOOK_URL=$(cat "$HOME/.config/atlas/slack_webhook")

    curl -sS \
        -H "Content-Type: application/json" \
        -d "{\"text\":\"$ERROR_MESSAGE\"}" \
        "$SLACK_WEBHOOK_URL" >/dev/null || \
        echo "Slack alert failed." >&2

    exit 1
fi
} 
atlas_app
#!/bin/bash

BACKUP_DIR="$HOME/Atlas-Platform1/atlas-backups"
DATABASE="atlas_notes"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

echo "Starting Atlas database backup..."

mkdir -p "$BACKUP_DIR"

sudo -u postgres pg_dump "$DATABASE" > "$BACKUP_DIR/atlas_notes_$TIMESTAMP.sql"

if [ $? -ne 0 ]; then
    echo "Database backup failed."
    exit 1
fi

gzip "$BACKUP_DIR/atlas_notes_$TIMESTAMP.sql"

if [ $? -ne 0 ]; then
    echo "Compression failed."
    exit 1
fi

echo "Backup completed successfully."
echo "Backup file:"
ls -lh "$BACKUP_DIR/atlas_notes_$TIMESTAMP.sql.gz"
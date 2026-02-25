#!/bin/bash

# Configuration
CONTAINER_NAME="postgres-db"
DB_USER="favero_user"
DB_NAME="sre_metrics"
BACKUP_PATH="./logs/backups"
DATE=$(date +%Y-%m-%d_%Hh%Mm)
FILENAME="backup_${DB_NAME}_${DATE}.sql"

# Ensure the backup directory exists
mkdir -p $BACKUP_PATH

echo "--- Starting Backup for $DB_NAME ---"

# Step 1: Execute pg_dump inside the container and save it to the host
docker exec $CONTAINER_NAME pg_dump -U $DB_USER $DB_NAME > $BACKUP_PATH/$FILENAME

# Step 2: Check if the file was created successfully
if [ -f "$BACKUP_PATH/$FILENAME" ]; then
    echo "✅ Success: Backup saved to $BACKUP_PATH/$FILENAME"
    # Optional: Keep only the last 7 days of backups
    find $BACKUP_PATH -type f -mtime +7 -name "*.sql" -delete
else
    echo "❌ Error: Backup failed!"
    exit 1
fi

echo "--- Backup Process Completed ---"

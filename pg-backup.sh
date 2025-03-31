#!/bin/bash

# Configuration
BACKUP_DIR="/mnt/pacs-backup/postgres-backup"
RETENTION_DAYS=7  # Change this to adjust number of days to keep backups
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/pacsdb_backup_$TIMESTAMP.sql"

# Ensure backup directory exists
mkdir -p "$BACKUP_DIR"

# Run pg_dump inside postgres container
docker exec db pg_dump -U pacs pacsdb > "$BACKUP_FILE"

# Clean up old backups
find "$BACKUP_DIR" -type f -name "pacsdb_backup_*.sql" -mtime +"$RETENTION_DAYS" -exec rm {} \;

echo "Backup completed: $BACKUP_FILE"
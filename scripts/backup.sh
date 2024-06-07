#!/bin/bash

# Définir les variables
TIMESTAMP=$(date +"%F")
BACKUP_DIR="/backup/$TIMESTAMP"
REMOTE_USER="user"
REMOTE_HOST="backupserver"
REMOTE_DIR="/path/to/remote/backup"

# Créer le répertoire de sauvegarde
mkdir -p "$BACKUP_DIR"

# Sauvegarder la base de données
sqlite3 /path/to/database.db ".backup '$BACKUP_DIR/database.db'"

# Transférer la sauvegarde vers le serveur distant
scp -r "$BACKUP_DIR" $REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR

# Nettoyage des anciennes sauvegardes (facultatif)
find /backup/* -mtime +7 -exec rm -rf {} \;

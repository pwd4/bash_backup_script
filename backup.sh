#!/bin/bash
# List of directories for backup is arguments, can be >=1.
if [ -n "$*" ]
then
    folder="$*"
    echo "Backup of $folder folder"
else
    folder="/etc"
    echo "Backup of default $folder folder"
fi
filename=backup-`date +%d_%m_%y`.tar.bz2 # Naming template
cd /root/backup # Directory for backup
echo «`date` — Start logging» >> /root/backup/backup.log # Start date for log-file
tar --totals -cvf $filename $folder # tar does its job
echo «`date` — Finish logging» >>/root/backup/backup.log # Finish date for log-file

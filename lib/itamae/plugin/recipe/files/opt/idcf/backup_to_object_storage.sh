#!/bin/bash
set -e

path=$(echo $1 | sed -re 's#/?$#/#')
bucket=${2%/}
expire=$3
command=$4

config="/etc/s3cmd/idcf/backup_to_object_storage.cfg"

if [ "$command" != "" ]; then
  : "Execute user command"
  eval $command
fi

: "Make bucket"
s3cmd -c $config mb s3://$bucket

: "Sync backups from object storage"
s3cmd -c $config sync s3://$bucket/ $path

: "Remove expired backups"
find $path -type f -daystart -mtime +$expire | xargs rm -f

: "Sync backups to object storage"
s3cmd -c $config sync --delete-removed $path s3://$bucket/

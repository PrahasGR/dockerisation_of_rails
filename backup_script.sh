#!/bin/sh
mysqldump -h db -u vedant -pInfinity@1 rec_2024 > /backups/db_backup_$(date +"%Y-%m-%d").sql
rsync -avz --exclude='node_modules' --exclude='log' --exclude='tmp' /path/to/your/rails/app /backups/rails_code_$(date +"%Y-%m-%d")
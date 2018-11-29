#!/bin/bash

# pai-backup-mysql-db
# Backup DB and keep 7 days
# pai-script-id=8fc5a3dd-ba8d-4cd4-51ce-7e0ae086b245
# Created by Eran Caballero on Thr Nov 29 12:15:27 UTC 2018
# Generated by PAI Linux Bot
# Copyrights PAI Tech INC 2018, all rights reserved

# PAI includes

PAI_SCRIPT_ID=8fc5a3dd-ba8d-4cd4-51ce-7e0ae086b245

PAI=/var/PAI
BACKUP_FOLDER="$PAI/Backup"
DB_BACKUP_FOLDER="$BACKUP_FOLDER/MySQL"
TAR_BACKUP_FILE_NAME=local-host-14_$_now
BACKUP_FOLDER=~/backup
_now=$(date +"%m_%d_%Y-%H.%M")
_file="$DB_BACKUP_FOLDER/wordpress_$_now.sql.gz"

. $PAI/System/pai.sh

# PAI functions

pai_8fc5a3dd-ba8d-4cd4-51ce-7e0ae086b245_intro() {
pai_log_sep
pai_log 'starting pai-backup-mysql-db...'
}

pai_backup()
{
	pai_log_sep
	pai_log 'Validating backup folder'
	pai_validate_folder $BACKUP_FOLDER
	pai_log 'starting backing-up PAI folder...'
	tar -zcvf /var/PAI ~/backup/pai-$TAR_BACKUP_FILE_NAME.tar.gz
}

pai_8fc5a3dd-ba8d-4cd4-51ce-7e0ae086b245_end() {
pai_log 'done :)'
}

# PAI main flow

pai_8fc5a3dd-ba8d-4cd4-51ce-7e0ae086b245_intro
pai_backup
pai_8fc5a3dd-ba8d-4cd4-51ce-7e0ae086b245_end
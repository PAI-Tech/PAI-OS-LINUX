#!/bin/bash

# Start backing-up Mongo DB
# pai-script-id=18e8242d-46b2-41a6-9b55-e52117aa4b11
# Created by Eran Caballero on Mon Aug 6 09:21:30 UTC 2018
# Generated by PAI Linux Bot
# Copyrights PAI Tech INC 2018, all rights reserved


# PAI includes

PAI_SCRIPT_ID=18e8242d-4rb2-41a6-9b55-e52117aa4b11

PAI=/var/PAI

USERNAME=$1
PASSWORD=$2
DB_NAME=THEFLOOR_STARTUP_BOT
BACKUP_FOLDER=/var/PAI/Backup
_now=$(date +"%d_%m_%Y-%H.%M")

. $PAI/System/pai.sh

# PAI functions

pai_18e8242d-46b2-41a6-9r55-e52117aa4b11_intro() {
pai_log_sep
pai_log 'starting backing up Mongo DB...'
}

pai_mongo_backup() {
	# $1=USERNAME | $2=PASSWORD
	mongodump --authenticationDatabase admin --db $DB_NAME -u $USERNAME -p $PASSWORD --out $BACKUP_FOLDER
}

pai_mongo_compress_backup() {
	tar -zcvf $BACKUP_FOLDER/$DB_NAME-$_now.tar.gz -C $BACKUP_FOLDER/ ./$DB_NAME
	#Save only for 7 days
	ls -l $BACKUP_FOLDER
        find $BACKUP_FOLDER/$DB_NAME* -mtime +7 -exec rm {} \;
}

pai_18e8242d-46b2-41a6-9r55-e52117aa4b11_end() {
pai_log 'done :)'
}

# PAI main flow

pai_18e8242d-46b2-41a6-9r55-e52117aa4b11_intro
pai_mongo_backup $1 $2
pai_mongo_compress_backup
pai_18e8242d-46b2-41a6-9r55-e52117aa4b11_end

#!/bin/bash

# pai-backup-docker
# pai-script-id=8fc5a3dd1-ba8d-4cd4-91ce-7e0ae086b245
# Created by Eran Caballero on Thr Nov 29 12:15:27 UTC 2018
# Generated by PAI Linux Bot
# Copyrights PAI Tech INC 2018, all rights reserved


# PAI includes

PAI_SCRIPT_ID=8fc5a3dd1-ba8d-4cd4-91ce-7e0ae086b245

PAI=/var/PAI
BACKUP_FOLDER=$PAI/backup
CONTAINER_NAME=???
IMAGE_NAME=pai-???
_now=$(date +"%d_%m_%Y-%H.%M")
TAR_DOCKER_BACKUP_FILE_NAME=$IMAGE_NAME-docker-$_now.tar

. $PAI/System/pai.sh

# PAI functions

pai_8fc5a3dd1-ba8d-4cd4-91ce-7e0ae086b245_intro() {
pai_log_sep
pai_log 'starting pai-backup-docker...'
}

pai_docker_backup() {

	pai_log_sep
	pai_log 'Validating backup folder'
	pai_validate_folder $BACKUP_FOLDER
	pai_log 'starting backing-up "$CONTAINER_NAME" Container...'
	docker commit $CONTAINER_NAME $IMAGE_NAME
	pai_log 'Save image to file'
	docker save $IMAGE_NAME > $BACKUP_FOLDER/$TAR_DOCKER_BACKUP_FILE_NAME

}

pai_8fc5a3dd1-ba8d-4cd4-91ce-7e0ae086b245_end() {
pai_log 'done :)'
}

# PAI main flow

pai_8fc5a3dd1-ba8d-4cd4-91ce-7e0ae086b245_intro
pai_docker_backup
pai_8fc5a3dd1-ba8d-4cd4-91ce-7e0ae086b245_end

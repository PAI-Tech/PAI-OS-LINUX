#!/bin/bash

# pai-install-docker-bot
# Create pai-bot docker
# pai-script-id=206b5dff-0a91-4b33-8715-41f12a280c50
# Created by Eran Caballero on Thu Aug 2 15:58:07 UTC 2018
# Generated by PAI Linux Bot
# Copyrights PAI Tech INC 2018, all rights reserved


# PAI includes

PAI_SCRIPT_ID=206b5dff-0a91-4b33-8715-41f12a280c50

PAI=/var/PAI
PAI_TAR_BOT_FOLDER="$PAI/Install/pai-bot-node.tar"

. $PAI/System/pai.sh

# PAI functions

pai_206b5dff-0a91-4b33-8715-41f12a280c50_intro() {
pai_log_sep
pai_log 'starting pai-install-docker-bot...'
}

pai_install_media_docker_image()
{
	# $1="docker name" \ $2="message"
	docker load --input $PAI_TAR_BOT_FOLDER
	echo ""
	docker run -itd --name $1 pai-bot-node
	docker exec -itd $1 bash -c "node /home/PAI-BOT-JS/PAI_init.js $2"
}

pai_206b5dff-0a91-4b33-8715-41f12a280c50_end() {
pai_log 'done :)'
}

# PAI main flow

pai_206b5dff-0a91-4b33-8715-41f12a280c50_intro
pai_install_media_docker_image "$1" "$2"
pai_206b5dff-0a91-4b33-8715-41f12a280c50_end

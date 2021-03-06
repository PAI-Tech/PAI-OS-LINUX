#!/bin/bash

# pai-node-5000-pull
# Pull nodejs port 5000
# pai-script-id=9917c87c-08fe-4910-a682-abcc21f009a0
# Created by Eran Caballero on Wed Jun 13 18:53:53 IDT 2018
# Generated by PAI Linux Bot
# Copyrights PAI Tech INC 2018, all rights reserved


# PAI includes

PAI_SCRIPT_ID=9917c87c-08fe-4910-a682-abcc21f009a0

PAI=/var/PAI

. $PAI/System/pai.sh

# PAI functions

pai_9917c87c-08fe-4910-a682-abcc21f009a0_intro() {
pai_log_sep
pai_log 'starting pai-node-5000-pull...'
}

pai_nodejs_5000_pull() {
cd /home/PAI-node-server/ && \
pm2 stop server.js && \
git pull && \
npm run build && \
pm2 start server.js
}

pai_9917c87c-08fe-4910-a682-abcc21f009a0_end() {
pai_log 'done :)'
}

# PAI main flow

pai_9917c87c-08fe-4910-a682-abcc21f009a0_intro
pai_nodejs_5000_pull
pai_9917c87c-08fe-4910-a682-abcc21f009a0_end

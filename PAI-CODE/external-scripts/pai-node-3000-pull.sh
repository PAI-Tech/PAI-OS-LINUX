#!/bin/bash

# pai-node-3000-pull
# Nodejs 3000 pull & start
# pai-script-id=a2e1e767-fbb1-4440-a7cc-f1b7507c21f1
# Created by Eran Caballero on Mon Jun 11 11:26:46 IDT 2018
# Generated by PAI Linux Bot
# Copyrights PAI Tech INC 2018, all rights reserved


# PAI includes

PAI_SCRIPT_ID=a2e1e767-fbb1-4440-a7cc-f1b7507c21f1

PAI=/var/PAI

#. $PAI/System/pai.sh

# PAI functions

pai_a2e1e767-fbb1-4440-a7cc-f1b7507c21f1_intro() {
pai_log_sep
pai_log 'starting pai-node-3000-pull...'
}

pai_nodejs_3000_pull() {
cd /home/PAI-node-server/ && \
pm2 stop server.js && \
git pull && \
npm install && \
pm2 start server.js
}

pai_a2e1e767-fbb1-4440-a7cc-f1b7507c21f1_end() {
pai_log 'done :)'
}

# PAI main flow

pai_a2e1e767-fbb1-4440-a7cc-f1b7507c21f1_intro
pai_nodejs_3000_pull
pai_a2e1e767-fbb1-4440-a7cc-f1b7507c21f1_end

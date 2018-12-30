#!/bin/bash

# pai-install-bot
# Eran Caballero
# pai-script-id=07a08866-4c2a-4f5b-99f5-38b12480e766
# Created by Eran Caballero on Thu Aug 9 08:13:46 UTC 2018
# Generated by PAI Linux Bot
# Copyrights PAI Tech INC 2018, all rights reserved


# PAI includes

PAI_SCRIPT_ID=07a08866-4c2a-4f5b-99f5-38b12480e766

PAI=/var/PAI

. $PAI/System/pai.sh

# PAI functions

pai_07a08866-4c2a-4f5b-99f5-38b12480e766_intro() {
pai_log_sep
pai_log 'starting pai-install-bot...'
}

pai_install_bot() {
echo ""
#echo -e 'Bot git clone:'
#git clone https://github.com/PAI-Tech/PAI-BOT-JS.git
cd $PAI/Bot/PAI-BOT-JS
rm package-lock.json
git reset --hard
git pull
npm i --production
echo ""
node PAI_init.js
echo ""
read -p "Please enter your bot name : " BOT_NAME
echo ""
pm2 start PAI.js --name $BOT_NAME --watch
pm2 save

pai_07a08866-4c2a-4f5b-99f5-38b12480e766_end() {
pai_log 'done :)'
}

# PAI main flow

pai_07a08866-4c2a-4f5b-99f5-38b12480e766_intro
pai_install_bot
pai_07a08866-4c2a-4f5b-99f5-38b12480e766_end

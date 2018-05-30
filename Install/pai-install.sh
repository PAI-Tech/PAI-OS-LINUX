#!/bin/bash

# pai-install
# PAI OS for Linux
# pai-script-id=3C1F2ED5-C28A-40EF-833E-9D93B8502C6E
# Created by Tamir Fridman on Mon May 28 18:01:48 IDT 2018
# Generated by PAI Linux Bot
# Copyrights PAI Tech INC 2018, all rights reserved


# PAI includes

PAI=/var/PAI
PAI_CONFIG_FOLDER=$PAI/Config
PAI_CONFIG_FILE=$PAI_CONFIG_FOLDER\pai.config
PAI_SCRIPT_GUID=$(uuidgen)

. $PAI/System/pai.sh

# PAI functions

pai_3C1F2ED5-C28A-40EF-833E-9D93B8502C6E_intro() {
	pai_log_sep
	pai_log 'starting pai-install...'
}

pai_3C1F2ED5-C28A-40EF-833E-9D93B8502C6E_validate_folders() {
	pai_log_sep
	pai_log 'Validate and creating folders'
	pai_validate_folder Logs
	pai_validate_folder System
	pai_validate_folder Config
	pai_validate_folder PAI-CODE
	pai_validate_folder Startup
}

pai_3C1F2ED5-C28A-40EF-833E-9D93B8502C6E_validate_folders_move() {
	pai_log_sep
	pai_log 'Validate and creating folders'
}

pai_3C1F2ED5-C28A-40EF-833E-9D93B8502C6E_update_config_file() {
	echo "OS GUID: $PAI_SCRIPT_GUID" >> $PAI_CONFIG_FILE
	echo Installation time: 
}

pai_3C1F2ED5-C28A-40EF-833E-9D93B8502C6E_end() {
	pai_log 'done :)'
}

# PAI main flow

pai_3C1F2ED5-C28A-40EF-833E-9D93B8502C6E_intro
pai_3C1F2ED5-C28A-40EF-833E-9D93B8502C6E_validate_folders


# update config file (\var\PAI\Config\pai.config):
#			OS GUID
#			Install time


pai_3C1F2ED5-C28A-40EF-833E-9D93B8502C6E_end

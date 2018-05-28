#!/bin/bash

# pai-startup
# PAI startup script. runs when OS starts
# pai-script-id=97A754F2-0C76-4E78-B1A7-8E10CF26F8DA
# Created by Tamir Fridman on Mon May 28 18:13:56 IDT 2018
# Generated by PAI Linux Bot
# Copyrights PAI Tech INC 2018, all rights reserved


# PAI includes

PAI=/var/PAI

. $PAI/System/pai.sh

# PAI functions

pai_97A754F2-0C76-4E78-B1A7-8E10CF26F8DA_intro() {
pai_log_sep
pai_log 'starting pai-startup...'
}

pai_97A754F2-0C76-4E78-B1A7-8E10CF26F8DA_end() {
pai_log 'done :)'
}

# PAI main flow

pai_97A754F2-0C76-4E78-B1A7-8E10CF26F8DA_intro
pai_97A754F2-0C76-4E78-B1A7-8E10CF26F8DA_end

#!/bin/bash\n
# pai-install-instance.sh
# Install new instance Inc. docker
# pai-script-id=9729e1ee-60d7-42cb-8f01-dcf075b4cbf9
# Created by Eran Caballero on Wed May 30 10:20:08 UTC 2018
# Generated by PAI Linux Bot
# Copyrights PAI Tech INC 2018, all rights reserved

# PAI includes

PAI=/var/PAI
PAI_LOGS=$PAI/Logs
PAI_MEDIA_FOLDER=$PAI/Media
PAI_MEDIA_PUBLIC_FOLDER=$PAI_MEDIA_FOLDER/public

. $PAI/System/pai.sh

PAI_INSTALLER_NAME="Pai Prepare Linux Ubuntu"

# PAI functions

pai_9729e1ee-60d7-42cb-8f01-dcf075b4cbf9_intro()
{
	pai_log "Prepairing Linux OS For Pai"
}

pai_update_os()
{
	pai_log "Updating OS & Installing Default (Linux)..."
	PAI_REQUIERED_PREPARE_INSTALLATION="pydf zip unzip htop git build-essential libssl-dev libffi-dev python-software-properties python-dev python-numpy python-tk python3-dev python3-tk python3-numpy"
	apt-get -qq update
	apt-get -qq install $PAI_REQUIERED_PREPARE_INSTALLATION
	#apt-get -qq -y upgrade
	pai_log "OS updated :)"
}

pai_update_locale()
{
	locale-gen "he_IL.UTF-8"
	locale-gen "en_US.UTF-8"
	#dpkg-reconfigure locales #IBM
	update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 #MS
	timedatectl set-timezone Etc/UTC
	pai_log "Locale (UTF+TZ) updated"
}

pai_handle_sudoers()
{
	pai_log "Handling Sudoers"
	dpkg-statoverride --update --add root sudo 4750 /bin/su
}

pai_update_profiles()
{
	if grep -r "PAI :]" "/etc/profile";
	then 
		pai_log "Profile file already updated"
	else
		echo "# PAI :]" >> /etc/profile
		echo "PAI=/var/PAI" >> /etc/profile
		echo "" >> /etc/profile
		echo "LD_LIBRARY_PATH=/usr/local/lib/" >> /etc/profile
		echo "PKG_CONFIG_PATH=/usr/local/lib/pkgconfig/" >> /etc/profile
		echo "" >> /etc/profile
		echo "JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> /etc/profile
		echo "JRE_HOME=/usr/lib/jvm/java-8-oracle/jre/bin/java" >> /etc/profile
		echo "PATH=$PATH:$HOME/bin:JAVA_HOME:JRE_HOME" >> /etc/profile
		. /etc/profile
		echo "nameserver 8.8.8.8" >> /etc/resolv.conf
		pai_log "Profile file updated"
	fi
}

pai_ssh_setup()
{
	SSHD_CONFIG_FILE="/etc/ssh/sshd_config"
	pai_log "Reconfigure password authentication"
	sed -i 's/^PasswordAuthentication.*/PasswordAuthentication yes/' $SSHD_CONFIG_FILE
	service ssh restart
	pai_log "Done..."
}

pai_docker_install()
{
	#install Docker
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
	apt-get -qq update
	apt-cache policy docker-ce
	apt-get install -qq -y docker-ce
	usermod -aG docker ${USER}

	#install docker-machine
	curl -L https://github.com/docker/machine/releases/download/v0.14.0/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine &&
	chmod +x /tmp/docker-machine && cp /tmp/docker-machine /usr/local/bin/docker-machine

	# Install docker-compose
	curl -L https://github.com/docker/compose/releases/download/1.21.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
	chmod +x /usr/local/bin/docker-compose
	pai_log "Docker installation done..."
}

pai_folders_validate()
{
	pai_validate_folder $PAI
	pai_validate_folder $PAI_MEDIA_FOLDER
	pai_validate_folder $PAI_MEDIA_PUBLIC_FOLDER
	pai_validate_folder $PAI_LOGS

	chmod -R 777 $PAI_LOGS
}

pai_open_web_port()
{
	service ufw stop
	iptables -P INPUT ACCEPT
	iptables -P OUTPUT ACCEPT
	iptables -P FORWARD ACCEPT
	iptables -F
}

pai_install_media_docker_image()
{
	HTML_FOLDER=/var/www/html/
	wget http://130.61.26.34:8080/docker/pai-media-streaming.tar
	docker load --input pai-media-streaming.tar
	docker run -p 80:80 -itd -v $PAI_MEDIA_PUBLIC_FOLDER:$HTML_FOLDER --name pai-media-streaming pai-media-vio
	wget http://130.61.26.34:8080/demo.tar.gz
	wget http://130.61.26.34:8080/media.tar.gz
	mv demo.tar.gz media.tar.gz $PAI_MEDIA_PUBLIC_FOLDER
	cd $PAI_MEDIA_PUBLIC_FOLDER
	tar -xvf demo.tar.gz
	tar -xvf media.tar.gz
	chown -R www-data:www-data $PAI_MEDIA_PUBLIC_FOLDER
}

pai_install_oracle_cli()
{
	bash -c "$(curl -L https://raw.githubusercontent.com/oracle/oci-cli/master/scripts/install/install.sh)"
	oci setup config
}

pai_9729e1ee-60d7-42cb-8f01-dcf075b4cbf9_end()
{
	pai_log_sep
	pai_log "IP/demo/tv-demo.html"
}



# PAI MAIN FLOW

pai_folders_validate
pai_prepare_intro
pai_update_os
pai_update_locale
pai_handle_sudoers
pai_update_profiles
pai_ssh_setup
pai_update_profiles
pai_docker_install
pai_open_web_port
pai_install_media_docker_image
pai_install_oracle_cli
pai_prepare_end

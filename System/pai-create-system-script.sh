
#!/bin/bash

#	
#	PAI System Script Creator
#	Creating linux system script.
#	Created by Tamir Fridman on 03/05/2018.	
#	Copyrights PAI Tech 2018, all rights reserved 


PAI=/var/PAI

. $PAI/System/pai.sh



PAI_SYSTEM_SCRIPT_EXT="sh"
PAI_SYSTEM_SCRIPT_NAME='default'
PAI_SYSTEM_SCRIPT_DESC=''
PAI_SYSTEM_SCRIPT_AUTHOR='PAI'
PAI_SCRIPT_GUID=$(uuidgen)


pai_cs_intro()
{
	pai_log_sep
	pai_log_console "PAI system script creator"
}


pai_write_to_script()
{
	echo $1>>$PAI_SYSTEM_SCRIPT_FULL_PATH
}


pai_read_parameters_for_script()
{
	echo ""
	read -p "Script Name: " PAI_SYSTEM_SCRIPT_NAME
	echo ""
	read -p "Script Description: " PAI_SYSTEM_SCRIPT_DESC
	echo ""
	read -p "Author: " PAI_SYSTEM_SCRIPT_AUTHOR
	PAI_SYSTEM_SCRIPT_FULL_PATH=./$PAI_SYSTEM_SCRIPT_NAME.$PAI_SYSTEM_SCRIPT_EXT

}

pai_create_script()
{
	pai_log "Creating script $PAI_SYSTEM_SCRIPT_FULL_PATH"
	pai_write_to_script "#!/bin/bash\n" 

	pai_write_to_script "# $PAI_SYSTEM_SCRIPT_NAME"
	pai_write_to_script "# $PAI_SYSTEM_SCRIPT_DESC"
	pai_write_to_script "# pai-script-id=$PAI_SCRIPT_GUID"
	pai_write_to_script "# Created by $PAI_SYSTEM_SCRIPT_AUTHOR on $(date)"
	pai_write_to_script "# Generated by PAI Linux Bot" 
	pai_write_to_script "# Copyrights PAI Tech INC 2018, all rights reserved\n" 

	pai_write_to_script "\n# PAI includes\n"
	pai_write_to_script "PAI_SCRIPT_ID=$PAI_SCRIPT_GUID\n"
	pai_write_to_script "PAI=/var/PAI\n"
	pai_write_to_script '. $PAI/System/pai.sh'

	pai_write_to_script "\n# PAI functions\n"
	pai_write_to_script "pai_$PAI_SCRIPT_GUID_intro() {\npai_log_sep\npai_log 'starting $PAI_SYSTEM_SCRIPT_NAME...'\n}\n"
	pai_write_to_script "pai_$PAI_SCRIPT_GUID_end() {\npai_log 'done :)'\n}"

	pai_write_to_script "\n# PAI main flow\n"

	pai_write_to_script "pai_"$PAI_SCRIPT_GUID"_intro"
	pai_write_to_script "pai_"$PAI_SCRIPT_GUID"_end"

	chmod +x $PAI_SYSTEM_SCRIPT_FULL_PATH
	echo ""
}

pai_cs_end()
{
	pai_log_console "System script create successfuly"
}

		

# PAI MAIN FLOW

pai_cs_intro
pai_read_parameters_for_script
pai_create_script
pai_cs_end

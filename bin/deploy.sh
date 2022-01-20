#!/bin/sh
PROJECT_FOLDER=$(pwd)

# Includes
FDC_LINKS=/opt/fdc.d/bin/links
source "$FDC_LINKS/invalid_project-link.sh"
source "$FDC_LINKS/sftp_transfer-link.sh"
source "$FDC_LINKS/parse_yaml-link.sh"

##################################################
##		MAIN DEPLOYMENT SCRIPT		##
##################################################
# @steps
#	1. Validate Manifest
#	2. Move build path to target server
#	3. Estabilish SSH connection to the server
#	4. Generate service unit
#	5. Generate logical links to service
#

Deploy() {
	eval $(parse_yaml "$PROJECT_FOLDER/manifest.yml" "manifest_")
	if [ ! -z $1 ]; then manifest_application_name=$1; fi

	Validate_Manifest
	SFTP
}



##################################################
##		VALIDATE MANIFEST FILE		##
##################################################
#	Just guarantees that the manifest file con
# tains all variables needed to deploy.

Validate_Manifest() {
	if [ -z $manifest_application_name ]; then
		Invalid_Application_Name
	elif [ -z $manifest_application_path ]; then
		Invalid_Path
	fi

	echo "Application name: $manifest_application_name"
}

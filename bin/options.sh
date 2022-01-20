#!/bin/sh
PROJECT_FOLDER=$(pwd)
FDC_LINKS=/opt/fdc.d/bin/links

source "$FDC_LINKS/invalid_project-link.sh"
source "$FDC_LINKS/help-link.sh"

source "$FDC_LINKS/deploy-link.sh"


if [ ! -r "$PROJECT_FOLDER/manifest.yml" ]; then
	Invalid_Project
	exit 1
fi


DEPLOY_FLAG="true"
while getopts ":hd:s:" option; do
   case $option in
     \?) # Invalid option
	DEPLOY_FLAG="false"
        echo "Error: Invalid option"
        Help
	exit;;



      h) # display Help
	DEPLOY_FLAG="false"
	Help;;

      s) # Change server deployment
	DEPLOY_FLAG="false"
	echo "Server Section: $OPTARG";;

	## Need to be the last one
      d) # Deploy option
	APP_NAME=$OPTARG
	DEPLOY_FLAG="true";;
   esac
done

if [ $DEPLOY_FLAG != "false" ]; then
	Deploy $APP_NAME
fi

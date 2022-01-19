#!/bin/sh
PROJECT_FOLDER=$(pwd)
FDC_LINKS=/opt/fdc/bin/links

source "$FDC_LINKS/invalid_project-link.sh"
source "$FDC_LINKS/help-link.sh"

source "$FDC_LINKS/deploy-link.sh"


if [ ! -r "$PROJECT_FOLDER/manifest.yml" ]; then
	Invalid_Project
	exit 1
fi



while getopts ":hds:" option; do
   case $option in
      h) # display Help
	Help
        exit;;

      d) # Deploy option
	APP_NAME=$OPTARG;;

      s) # Change server deployment
	Server
	exit;;

     \?) # Invalid option
        echo "Error: Invalid option"
        Help
	exit;;
   esac
done

Deploy $APP_NAME

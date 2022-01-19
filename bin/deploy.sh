#!/bin/sh
PROJECT_FOLDER=$(pwd)
FDC_LINKS=/opt/fdc/bin/links

source "$FDC_LINKS/parse_yaml-link.sh"

Deploy() {
echo "opts $1"
	eval $(parse_yaml manifest.yml "manifest_")
	echo "$manifest_development_adapter"
}

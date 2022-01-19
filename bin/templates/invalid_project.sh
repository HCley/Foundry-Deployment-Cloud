#!/bin/sh

Invalid_Project()
{
	if [ -f "$PROJECT_FOLDER/manifest.yml" ]; then
		echo "Missing read permission to manifest.yml file."
	else
		echo "It is not a project folder;"
		echo "There is no Manifest file."
	fi
}

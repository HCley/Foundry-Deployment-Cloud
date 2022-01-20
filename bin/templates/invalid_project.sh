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


Invalid_Path()
{
	echo "Missing build file path on manifest file."
	echo "Example of usage on manifest.yml"
	echo "application:"
	echo "	path: /build/libs/<?.jar|?.war>"
}

Invalid_Application_Name()
{
	echo "Missing application name on manifest file."
	echo "Example of usage on manifest.yml"
	echo "application:"
	echo "	name: <application name>"
}

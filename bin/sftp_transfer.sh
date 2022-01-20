#!/bin/sh
PROJECT_FOLDER=$(pwd)
FDC_LINKS=/opt/fdc.d/bin/links

SFTP()
{
	#export SSHPASS=
	#SFTP_HOSTNAME=
	#SFTP_HOST=

	sshpass -e sftp -P 22 $SFTP_HOSTNAME@$SFTP_HOST <<-EOT
		put $PROJECT_FOLDER/build/libs/app.jar
		exit
	EOT
}

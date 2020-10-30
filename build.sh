#!/bin/bash

SCRIPT=$(readlink -f $0)
SCRIPT_PATH=`dirname $SCRIPT`
BASE_PATH=`dirname $SCRIPT_PATH`

RETVAL=0
VERSION=0.1
TAG=`date '+%Y%m%d_%H%M%S'`

case "$1" in
	
	installer)
		docker build ./ -t bayrell/cloud_os_installer:$VERSION-$TAG --file docker/cloud_os_installer.dockerfile
		docker tag bayrell/cloud_os_installer:$VERSION-$TAG bayrell/cloud_os_installer:latest
		cd ..
	;;
	
	*)
		echo "Usage: $0 {installer}"
		RETVAL=1

esac

exit $RETVAL
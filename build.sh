#!/bin/bash

SCRIPT=$(readlink -f $0)
SCRIPT_PATH=`dirname $SCRIPT`
BASE_PATH=`dirname $SCRIPT_PATH`

RETVAL=0
VERSION=0.1.0
TAG=`date '+%Y%m%d_%H%M%S'`

case "$1" in
	
	build)
		docker build ./ -t bayrell/cloud_os_installer:$VERSION-$TAG --file Dockerfile
		cd ..
	;;
	
	amd64)
		docker build ./ -t bayrell/cloud_os_installer:$VERSION-amd64 --file Dockerfile --build-arg ARCH=-amd64
		docker push bayrell/cloud_os_installer:$VERSION-amd64
	;;
	
	arm32v7)
		docker build ./ -t bayrell/cloud_os_installer:$VERSION-arm32v7 --file Dockerfile --build-arg ARCH=-arm32v7
		docker push bayrell/cloud_os_installer:$VERSION-arm32v7
	;;
	
	manifest)
		docker manifest create bayrell/cloud_os_installer:$VERSION \
			--amend bayrell/cloud_os_installer:$VERSION-amd64 \
			--amend bayrell/cloud_os_installer:$VERSION-arm32v7
		docker manifest push bayrell/cloud_os_installer:$VERSION
	;;
	
	all)
		$0 amd64
		$0 arm32v7
		$0 manifest
	;;
	
	*)
		echo "Usage: $0 {build|amd64|arm32v7|manifest|all}"
		RETVAL=1

esac

exit $RETVAL
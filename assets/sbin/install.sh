#!/bin/sh

set -e

if [ -e /tmp/assets/conf/build-deps.packages ] && [ -s /tmp/assets/conf/build-deps.packages ] ; then
	echo "[INFO] Install build deps" && \
        apk add --no-cache --virtual build-deps \
            $(cat /tmp/assets/conf/build-deps.packages) 
fi

if [ -e /tmp/assets/conf/alpine.packages ] && [ -s /tmp/assets/conf/alpine.packages ] ; then
	echo "[INFO] Install Alpine packages" && \
        apk add --no-cache \
            $(cat /tmp/assets/conf/alpine.packages) 
fi

if [ -e /tmp/assets/conf/python.packages ] && [ -s /tmp/assets/conf/python.packages ] ; then
	echo "[INFO] Install Python packages" && \
        pip3 install --upgrade -r /tmp/assets/conf/python.packages
fi

if [ -d /tmp/assets/sbin/ ] ; then
    echo '[INFO] Update scripts'
    [ -f /tmp/assets/sbin/entrypoint.sh ] && mv /tmp/assets/sbin/entrypoint.sh /sbin
    [ -f /tmp/assets/sbin/install.sh ] && mv /tmp/assets/sbin/install.sh /sbin
    [ -f /tmp/assets/sbin/cleanup.sh ] && mv /tmp/assets/sbin/cleanup.sh /sbin
fi

if [ -e /tmp/assets/conf/build-deps.packages ] && [ -s /tmp/assets/conf/build-deps.packages ] ; then
	echo "[INFO] Remove build deps" && \
        apk del build-deps
fi

echo "[INFO] Remove temporary files" && \
    /sbin/cleanup.sh

echo "[INFO] List of installed python packages" && \
    pip3 freeze


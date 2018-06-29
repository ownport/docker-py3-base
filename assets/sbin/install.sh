#!/bin/sh

set -e

export DEBIAN_FRONTEND=noninteractive

echo "[INFO] Update apt index and upgrade to latest versions for core components" && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        dialog apt-utils && \
    apt-get upgrade -y 
    

if [ -e /tmp/assets/conf/build-deps.packages ] && [ -s /tmp/assets/conf/build-deps.packages ] ; then
	echo "[INFO] Install build deps" && \
        apt-get install -y --no-install-recommends \
            $(cat /tmp/assets/conf/build-deps.packages) 
fi

if [ -e /tmp/assets/conf/debian.packages ] && [ -s /tmp/assets/conf/debian.packages ] ; then
	echo "[INFO] Install Debian packages" && \
        apt-get install -y --no-install-recommends \
            $(cat /tmp/assets/conf/debian.packages) 
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
        apt-get --purge remove -y $(cat /tmp/assets/conf/build-deps.packages) 
fi

echo "[INFO] Remove temporary files" && \
    /sbin/cleanup.sh

echo "[INFO] List of installed python packages" && \
    pip3 freeze


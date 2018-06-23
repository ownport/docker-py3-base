#!/usr/bin/env sh

case ${1} in
    help)
        echo 'Available options:'
        echo ' help                 - Displays the help'
        echo ' [command]            - Execute the specified command, eg. bash.'
        ;;
    *)
        if [ ! "$@" ]; then
            echo "[WARNING] No entrypoint specified" 
        else
            exec "$@"
        fi
        ;;
esac 

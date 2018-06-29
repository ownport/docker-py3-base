#!/bin/sh

echo '[INFO] Remove temporary files' && \
    rm -rf \
        /tmp/* \
        /root/.cache/* \
        /var/lib/apt/lists/*


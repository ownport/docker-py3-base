FROM debian:stretch-slim

COPY assets/ /tmp/assets/

RUN echo '[INFO] Configure environment' && \
        /tmp/assets/sbin/install.sh 
        
ENTRYPOINT ["/sbin/entrypoint.sh"]

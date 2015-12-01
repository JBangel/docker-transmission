FROM alpine:latest
MAINTAINER Joshua Bangel <development@joshuabangel.me>

# Install
RUN echo http://nl.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories
RUN apk --update add \
     bash   \
     shadow \
     transmission-daemon

# Cleanup
RUN rm -rf /var/cache/apk/*

# Prep
COPY transmission.sh /usr/bin/
RUN mkdir -p /transmission/{download,watch,incomplete,config} \
 && chmod 1777 /transmission \
 && chmod  777 /usr/bin/transmission.sh

EXPOSE 9091 51413/tcp 51413/udp

ENTRYPOINT "/usr/bin/transmission.sh"

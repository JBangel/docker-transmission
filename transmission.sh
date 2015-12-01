#!/usr/bin/env bash

######################################################################
#
#  transmission.sh
#
######################################################################
#
#  Startup script for transmission
#
#  Some concepts taken from dperson/transmission
#  https://github.com/dperson/transmission/blob/master/transmission.sh
#
######################################################################

DEFAULT_BASE_DIR="/transmission"
BASE_DIR=${BASE_DIR:-$DEFAULT_BASE_DIR}

[[ "${UID:-""}" =~ ^[0-9]+$ ]] && usermod  -u $UID debian-transmission
[[ "${GID:-""}" =~ ^[0-9]+$ ]] && groupmod -g $GID debian-transmission

[[ -d $dir/downloads ]]       || mkdir -p $dir/downloads
[[ -d $dir/incomplete ]]      || mkdir -p $dir/incomplete
[[ -d $dir/info/blocklists ]] || mkdir -p $dir/info/blocklists

/usr/bin/transmission-daemon                     \
      --allowed "127.*,10.*,192.168.*"           \
      --watch-dir "${BASE_DIR}/watch"            \
      --encryption-preferred                     \
      --foreground                               \
      --config-dir "${BASE_DIR}/config"          \
      --incomplete-dir "${BASE_DIR}/incomplete"  \
      --dht                                      \
      --no-auth                                  \
      --download-dir "${BASE_DIR}/download"


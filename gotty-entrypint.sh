#!/bin/sh

nohup /usr/local/bin/gotty --permit-write --reconnect /bin/sh > /dev/null 2>&1 &
/usr/local/bin/dockerd-entrypoint.sh

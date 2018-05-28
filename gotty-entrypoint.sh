#!/bin/sh

nohup /usr/local/bin/gotty --permit-write --reconnect /bin/sh > /dev/null 2>&1 &

sed -i s~https://regitry.docker-cn.com~${REGISTRY_MIRROR}~ /etc/docker/daemon.json 
sed -i s~docker-registry.oa.com~${INSECURE_REGISTRIE}~ /etc/docker/daemon.json 
/usr/local/bin/dockerd-entrypoint.sh

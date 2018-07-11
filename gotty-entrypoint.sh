#!/bin/sh

sed -i s~https://regitry.docker-cn.com~${REGISTRY_MIRROR}~ /etc/docker/daemon.json 
sed -i s~docker-registry.oa.com~${INSECURE_REGISTRIE}~ /etc/docker/daemon.json 

if [ "$DIND_MODE" = "1" -o "$DIND_MODE" = "yes" ]
then
	nohup /usr/local/bin/dockerd-entrypoint.sh > /dev/null 2>&1 &
fi

/usr/local/bin/gotty --permit-write -p 8080 /bin/sh


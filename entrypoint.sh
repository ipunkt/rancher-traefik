#!/bin/sh

SEDCOMMANDS=""
add_env() 
{
	NAME=$1
	DEFAULTVALUE=$2
 
	eval "VALUE=\"\$$NAME\""
	if [ -z "$VALUE" ] ; then
		VALUE="$DEFAULTVALUE"
	fi

	SEDCOMMANDS="$SEDCOMMANDS -e s~##$NAME##~$VALUE~g"
	return
}

add_env "GRACE" "10s"
add_env "DEBUG" "false"
add_env "LOGLEVEL" "ERROR"
add_env "THROTTLE" "2s"
add_env "MAXKEEPALIVE" "200"
add_env "BACKENDSECURE" 'true'
add_env "RANCHERDOMAIN" "ahgz.website"
add_env "REFRESH" "15"
add_env "DEFAULTEXPOSE" "false"
add_env "HEALTHCHECK" "true"
add_env "RANCHERAPI" "MISSING"
add_env "RANCHERKEY" "MISSING"
add_env "RANCHERSECRET" "MISSING"

sed $SEDCOMMANDS /opt/traefik.toml > /opt/etc/traefik/traefik.toml

$*

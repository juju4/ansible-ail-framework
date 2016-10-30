#!/bin/sh
## one script to be used by travis, jenkins, packer...

umask 022

if [ $# != 0 ]; then
rolesdir=$1
else
rolesdir=$(dirname $0)/..
fi

[ ! -d $rolesdir/juju4.faup ] && git clone https://github.com/juju4/ansible-faup $rolesdir/juju4.faup
[ ! -d $rolesdir/juju4.tlsh ] && git clone https://github.com/juju4/ansible-tlsh $rolesdir/juju4.tlsh
[ ! -d $rolesdir/juju4.redis-leveldb ] && git clone https://github.com/juju4/ansible-redis-leveldb $rolesdir/juju4.redis-leveldb
[ ! -d $rolesdir/juju4.pystemon ] && git clone https://github.com/juju4/ansible-pystemon $rolesdir/juju4.pystemon
[ ! -d $rolesdir/geerlingguy.redis ] && git clone https://github.com/juju4/ansible-faup $rolesdir/geerlingguy.redis


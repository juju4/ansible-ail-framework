#!/bin/sh
## one script to be used by travis, jenkins, packer...

umask 022

if [ $# != 0 ]; then
rolesdir=$1
else
rolesdir=$(dirname $0)/..
fi

[ ! -d $rolesdir/juju4.redhat_epel ] && git clone https://github.com/juju4/ansible-redhat-epel $rolesdir/juju4.redhat_epel
[ ! -d $rolesdir/juju4.faup ] && git clone https://github.com/juju4/ansible-faup $rolesdir/juju4.faup
[ ! -d $rolesdir/juju4.tlsh ] && git clone https://github.com/juju4/ansible-tlsh $rolesdir/juju4.tlsh
[ ! -d $rolesdir/juju4.redis-leveldb ] && git clone https://github.com/juju4/ansible-redis-leveldb $rolesdir/juju4.redis-leveldb
[ ! -d $rolesdir/juju4.pystemon ] && git clone https://github.com/juju4/ansible-pystemon $rolesdir/juju4.pystemon
#[ ! -d $rolesdir/geerlingguy.redis ] && git clone https://github.com/geerlingguy/ansible-role-redis.git $rolesdir/geerlingguy.redis
[ ! -d $rolesdir/geerlingguy.redis ] && git clone https://github.com/juju4/ansible-role-redis.git $rolesdir/geerlingguy.redis
## galaxy naming: kitchen fails to transfer symlink folder
#[ ! -e $rolesdir/juju4.ail-framework ] && ln -s ansible-ail-framework $rolesdir/juju4.ail-framework
[ ! -e $rolesdir/juju4.ail-framework ] && cp -R $rolesdir/ansible-ail-framework $rolesdir/juju4.ail-framework

## don't stop build on this script return code
true

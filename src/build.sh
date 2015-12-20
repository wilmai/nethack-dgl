#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

# Install nethack
groupadd nethack
useradd -g nethack nethack
pushd nethack-3.6.0
make all
make install
popd
cp -R configs/nh360/* /root/nh360/

# Install dgamelaunch
pushd dgamelaunch
sh autogen.sh --enable-shmem --with-config-file=/root/dgldir/dgamelaunch.conf
make
DGLBIN="dgamelaunch.`date +%Y%m%d`"
DGLINSTDIR="/root/dgldir"
rm -rf "$DGLINSTDIR"
mkdir "$DGLINSTDIR"
cp dgamelaunch "$DGLINSTDIR/$DGLBIN"
ln -s "$DGLINSTDIR/$DGLBIN" "$DGLINSTDIR/dgamelaunch"
# Copy editors
cp ee "$DGLINSTDIR/"
cp virus "$DGLINSTDIR/"
touch "$DGLINSTDIR/dgl-login"
touch "$DGLINSTDIR/dgl-lock"
popd
cp -R configs/dgamelaunch/* "$DGLINSTDIR/"

# Copy in data
mkdir -p /root/data
cp -R configs/data/* /root/data/

chown -R dglaunch:dglaunch /root


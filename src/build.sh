# Install nethack
groupadd nethack
useradd -g nethack nethack
pushd nethack-3.6.0
make all
make install
popd
cp configs/sysconf /root/nh360/

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
popd
# Copy config
cp configs/dgamelaunch.conf "$DGLINSTDIR/"

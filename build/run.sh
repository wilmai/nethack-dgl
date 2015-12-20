DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd $DIR
docker build -t dglaunch-run $PWD
docker run -d \
 --volume="$PWD/root:/root" \
 -p 23:23 \
 dglaunch-run
popd

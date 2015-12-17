docker build -t test1 $PWD
docker run -t -i --rm \
 --volume="$PWD/src:/src" \
 --volume="$PWD/build:/root" \
 test1

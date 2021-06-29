#!/bin/sh

if [ -z "$1"  ] || [ -z "$2" ]
  then
    echo "usage: $0 image /path/to/mount"
    echo "  ie ubuntu:21.04 \$HOME/pwn"
    exit 1
fi

TMP_DIR=$(mktemp -d -t pwn-XXXXXXXXXX)

echo "building in $TMP_DIR"

cp Dockerfile $TMP_DIR
sed -i -e "s/DOCKER_FROM_LABEL/$1/g" $TMP_DIR/Dockerfile

docker build $TMP_DIR && \
  docker run -it --net=host --privileged -v $2:/pwn $(docker build -q $TMP_DIR)

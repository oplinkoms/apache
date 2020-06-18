#!/bin/bash

CUR_PATH=`pwd`
INSTALL_PATH=/usr/local/apache2
MAKEFILE_DIRS="./Makefile"

####  check execute result
function return_val()
{
    val=`echo $?`
    if test $val -ne 0;then
        echo "#########  `pwd` is ERROR..."
        exit -1
    fi
}


if [ ! -f  "$MAKEFILE_DIRS" ]; then
    ./configure --prefix=$INSTALL_PATH --with-included-apr;return_val
    make clean
fi
    make;return_val
    sudo make install;return_val
    echo "--------- finished install httpd"

### manual copy
### cp -pfr $INSTALL_PATH/ shasta/cfg/filesystem/usr/local/

exit 0

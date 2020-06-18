#!/bin/bash

SUBDIRS='httpd'

####  check execute result
function return_val()
{
	    val=`echo $?`
	    if test $val -ne 0;then
	      echo "#########  `pwd` is ERROR..."
	      exit -1
	     fi
}

for i in $SUBDIRS; do 
    echo "+++++++++ enter $i"
    cd $i;return_val
    ./build.sh ;return_val
    cd ..;return_val
    echo "--------- exit $i"
done

exit 0


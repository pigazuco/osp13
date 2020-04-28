#!/bin/bash
for line in `cat rpms.txt`
do
        echo " Descargando $line"
        yum_output=$(yumdownloader --destdir=/tmp/rpms/ $line)
        if [ $? -ne 0 ];then
                echo "File $line was not found"
                echo "$line" >> missing.txt
        fi
done
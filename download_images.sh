#!/usr/bin/bash
for Name in `cat image.txt |awk '{print $2}'`
do
    docker pull $Name:queens
done

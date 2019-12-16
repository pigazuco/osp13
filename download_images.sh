#!/usr/bin/bash
for Name in `cat images.txt |awk '{print $2}'`
do
    docker pull $Name:queens
done

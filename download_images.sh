#!/usr/bin/env sh
for Name in `cat image.txt |awk '{print $1}'`
do
    docker pull $Name:stein
done
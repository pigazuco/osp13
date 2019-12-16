#!/usr/bin/bash
for Name in `cat images.txt |awk '{print $2}'`
do
    docker pull $Name
    docker tag $Name registry.mad.lab:5000/$Name
    docker push registry.mad.lab:5000/$Name
done

#!/bin/bash
PROJECT=$1
echo Borrando project $1
export NEW_PROJECT="$PROJECT"
export OS_TENANT_NAME=$NEW_PROJECT
export OS_PROJECT_NAME=$NEW_PROJECT

openstack server delete $1-1
openstack server delete $1-2
openstack security group rule delete --proto tcp --dst-port 22 $1-SECURITY-GROUP
openstack security group rule delete --proto icmp $1-SECURITY-GROUP
openstack security group delete $1-SECURITY-GROUP
openstack router remove subnet $1-ROUTER $1-SUBNET10
openstack router delete $1-ROUTER
openstack subnet delete $1-SUBNET10
openstack network delete $1-NET10
openstack project delete $1
neutron purge $1

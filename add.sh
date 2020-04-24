#!/bin/bash
PROJECT=$1
echo Creando project $1
export NEW_PROJECT="$PROJECT"
echo Creando $NEW_PROJECT project
openstack project create --description $NEW_PROJECT $NEW_PROJECT
openstack role add --user admin --project $NEW_PROJECT admin
export OS_TENANT_NAME=$NEW_PROJECT
export OS_PROJECT_NAME=$NEW_PROJECT
openstack network create $NEW_PROJECT-NET10
openstack subnet create --network $NEW_PROJECT-NET10 --subnet-range 10.0.0.0/24 $NEW_PROJECT-SUBNET10
openstack router create $NEW_PROJECT-ROUTER
openstack router add subnet $NEW_PROJECT-ROUTER $NEW_PROJECT-SUBNET10
openstack security group create $OS_TENANT_NAME-SECURITY-GROUP
openstack security group rule create --proto tcp --dst-port 22 $OS_TENANT_NAME-SECURITY-GROUP
openstack security group rule create --proto icmp $OS_TENANT_NAME-SECURITY-GROUP
openstack server create --security-group $OS_TENANT_NAME-SECURITY-GROUP --flavor small --image cirros --nic net-id=$OS_TENANT_NAME-NET10 $OS_TENANT_NAME-1
openstack server create --security-group $OS_TENANT_NAME-SECURITY-GROUP --flavor small --image cirros --nic net-id=$OS_TENANT_NAME-NET10 $OS_TENANT_NAME-2
neutron router-gateway-set $OS_TENANT_NAME-ROUTER L3OUT_AIBARRIO
openstack ip floating create L3OUT_AIBARRIO
echo openstack server add floating ip server ip

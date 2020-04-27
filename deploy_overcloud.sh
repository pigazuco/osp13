#!/bin/bash
echo "Deploying direct in nodes"
openstack baremetal node set --deploy-interface direct node1
openstack baremetal node set --deploy-interface direct node2
openstack baremetal node set --deploy-interface direct node3
echo "Overlcoud deploy aci_roles_data.yaml,ciscoaci_containers.yaml,ciscoaci-env.yaml"
#time openstack overcloud deploy --templates --roles-file ~/templates/aci_roles_data.yaml --environment-file ~/templates/ciscoaci_containers.yaml --environment-file ~/templates/ciscoaci-env.yaml --ntp-server 1.255.0.1

time openstack overcloud deploy --templates \
--roles-file ~/templates/aci_roles_data.yaml \
--environment-file ~/generated-openstack-tripleo-heat-templates/environments/network-isolation.yaml \
--environment-file ~/templates/network-environment-overrides.yaml \
--environment-file ~/templates/ciscoaci_containers.yaml \
--environment-file ~/templates/ciscoaci-env.yaml \
--ntp-server 1.255.0.1

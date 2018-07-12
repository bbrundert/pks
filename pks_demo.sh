#!/bin/bash

#######
# might require some tools to be installed:
# 
# pv: http://www.ivarch.com/programs/pv.shtml
#
# sudo apt-get install pv
# brew install pv
#
########################
# include the magic
########################
. ./demo-magic/demo-magic.sh
TYPE_SPEED=15
DEMO_PROMPT='\A \u@\h \W \! >' 

# hide the evidence
clear

# Put your stuff here
pe "pks login -a pks.corp.local -u admin -p MXoIThjoSxm2NBVNOh_AjKm5lgvzQH6l -k"
pe "pks clusters"
pe "pks cluster my-cluster"
p "pks create-cluster my-kube -e 10.40.14.34 -n 1"
pe "bosh -e kubobosh deployments"
pe "bosh -e kubobosh deployments | grep service-instance_*"
SERVICEINSTANCE=$(bosh -e kubobosh deployments | grep service-instance_* | awk '{print $1}')
pe "bosh -e kubobosh -d $SERVICEINSTANCE instances"
p "Additional Troubleshooting Commands"
p "bosh -e kubobosh -d $SERVICEINSTANCE ssh worker/87333ba4-3473-4959-8f53-a35282f5f7df"
p "bosh -e kubobosh -d $SERVICEINSTANCE logs"

#test

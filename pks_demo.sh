#!/bin/bash

########################
# include the magic
########################
. demo-magic.sh

# hide the evidence
clear

# Put your stuff here
pe "pks login -a pks.corp.local -u admin -p MXoIThjoSxm2NBVNOh_AjKm5lgvzQH6l -k"
pe "pks clusters"
pe "pks cluster my-cluster"
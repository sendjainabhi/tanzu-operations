#!/bin/bash

########################
# include the magic
########################
. demo-magic.sh

########################
# Configure the options
########################

#
# speed at which to simulate typing. bigger num = faster
#
TYPE_SPEED=20

#
# custom prompt
#
# see http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/bash-prompt-escape-sequences.html for escape sequences
#
#DEMO_PROMPT="${GREEN}➜ ${CYAN}\W "

# hide the evidence
clear

tmc_quota_cluster_aks=tmc-quota-cluster-aks


#QUOTA POLICY
DEMO_PROMPT="${GREEN}➜ TMC QUOTA POLICY ${CYAN}\W "
echo

pe "kubectl config use-context ${tmc_quota_cluster_aks}"
echo

pe "kubectl apply -f tmc/configs/quota-exceeds.yaml"
echo

pe "kubectl get events | grep FailedCreate"
echo

pe "kubectl get pods"
echo


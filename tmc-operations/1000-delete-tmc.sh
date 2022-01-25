#CLUSTER GROUPS
cluster_group=cluster-group
quota_cluster_group=quota-cluster-group

#CLUSTERS
tmc_access_cluster=tmc-access-cluster
tmc_registry_and_network_cluster=tmc-registry-and-network-cluster
tmc_security_cluster=tmc-security-cluster
tmc_quota_cluster=tmc-quota-cluster
tmc_custom_cluster=tmc-custom-cluster

#WORKSPACES
registry_workspace=registry-workspace
network_workspace=network-workspace

#NAMESPACES
registry=registry
network=network



#DELETE POLICIES
tmc organization iam remove-binding -u michael.james.mj.mj@gmail.com -r organization.view
tmc workspace image-policy delete registry-policy --workspace-name $registry_workspace
tmc workspace network-policy delete network-policy --workspace-name $network_workspace
tmc clustergroup security-policy delete security-policy --cluster-group-name $quota_cluster_group
tmc clustergroup namespace-quota-policy delete quota-policy --cluster-group-name $quota_cluster_group

#DELETE NAMESPACES
tmc cluster namespace delete $registry --cluster-name $tmc_registry_and_network_cluster --management-cluster-name attached --provisioner-name attached
tmc cluster namespace delete $network --cluster-name $tmc_registry_and_network_cluster --management-cluster-name attached --provisioner-name attached

#DELETE WORKSPACES
tmc workspace delete $registry_workspace
tmc workspace delete $network_workspace

#DELETE CLUSTERS
tmc cluster delete $tmc_access_cluster --management-cluster-name attached --provisioner-name attached
tmc cluster delete $tmc_registry_and_network_cluster --management-cluster-name attached --provisioner-name attached
tmc cluster delete $tmc_security_cluster --management-cluster-name attached --provisioner-name attached
tmc cluster delete $quota_cluster_group --management-cluster-name attached --provisioner-name attached
tmc cluster delete $custom_cluster_group --management-cluster-name attached --provisioner-name attached

read -p "Enter to continue"

#DELETE CLUSTER GROUPS
tmc clustergroup delete $cluster_group
tmc clustergroup delete $workspace_group

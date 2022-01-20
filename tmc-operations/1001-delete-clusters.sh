#!/bin/bash

#EKS CLUSTERS
arn=arn:aws:eks:ap-northeast-1:964978768106:cluster

access_cluster_group=eks-access-cluster-group
quota_cluster_group=eks-quota-cluster-group
custom_cluster_group=eks-custom-cluster-group

#DELETE TMC-ACCESS-CLUSTER
kubectl config use-context $access_cluster_group

aws eks delete-nodegroup --cluster-name $access_cluster_group --nodegroup-name ${access_cluster_group}-node-group
aws eks wait nodegroup-active --cluster-name $access_cluster_group --nodegroup-name ${access_cluster_group}-node-group

kubectl get svc --all-namespaces
read -p "Service Name: " service_name

if [ -z "$service_name" ]
then
	echo "Service not found"
else
	kubectl delete svc $service_name
fi

kubectl config delete-user $arn/$access_cluster_group
kubectl config delete-cluster $arn/$access_cluster_group
kubectl config delete-context $access_cluster_group

aws eks delete-cluster --name $access_cluster_group


#DELETE TMC-QUOTA-CLUSTER
kubectl config use-context $quota_cluster_group

aws eks delete-nodegroup --cluster-name $quota_cluster_group --nodegroup-name ${quota_cluster_group}-node-group
aws eks wait nodegroup-active --cluster-name $quota_cluster_group --nodegroup-name ${quota_cluster_group}-node-group

kubectl get svc --all-namespaces
read -p "Service Name: " service_name

if [ -z "$service_name" ]
then
	echo "Service not found"
else
	kubectl delete svc $service_name
fi

kubectl config delete-user $arn/$quota_cluster_group
kubectl config delete-cluster $arn/$quota_cluster_group
kubectl config delete-context $quota_cluster_group

aws eks delete-cluster --name $quota_cluster_group



#DELETE TMC-CUSTOM-CLUSTER
kubectl config use-context $custom_cluster_group

aws eks delete-nodegroup --cluster-name $custom_cluster_group --nodegroup-name ${custom_cluster_group}-node-group
aws eks wait nodegroup-active --cluster-name $custom_cluster_group --nodegroup-name ${custom_cluster_group}-node-group

kubectl get svc --all-namespaces
read -p "Service Name: " service_name

if [ -z "$service_name" ]
then
	echo "Service not found"
else
	kubectl delete svc $service_name
fi

kubectl config delete-user $arn/$custom_cluster_group
kubectl config delete-cluster $arn/$custom_cluster_group
kubectl config delete-context $custom_cluster_group

aws eks delete-cluster --name $custom_cluster_group


#DELETE AKS CLUSTERS
prefix=clusterUser_tanzu-mission-control
registry_and_network_cluster=aks-registry-and-network-cluster

az aks delete --name $registry_and_network_cluster --resource-group tanzu-mission-control

kubectl config delete-user ${prefix}_${registry_and_network_cluster}
kubectl config delete-cluster ${registry_and_network_cluster}
kubectl config delete-context ${registry_and_network_cluster}


#DELETE TMC-SECURITY-CLUSTER
prefix=gke_pa-mjames_asia-northeast1
security_cluster_group=gke-security-cluster-group

gcloud container clusters delete "${security_cluster_group}" --region "asia-northeast1"

kubectl config delete-user ${prefix}_${security_cluster_group}
kubectl config delete-cluster ${prefix}_${security_cluster_group}
kubectl config delete-context ${security_cluster_group}
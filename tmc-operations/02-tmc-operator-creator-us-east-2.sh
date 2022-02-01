instance_id=$(aws ec2 run-instances --image-id ami-0fb653ca2d3203ac1 --instance-type t3a.2xlarge --block-device-mappings '{"DeviceName": "/dev/sda1", "Ebs": {"DeleteOnTermination": true, "VolumeSize": 500}}' --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=tmc-operator-us-east-2}]' --security-group-ids tanzu-operations-us-east-2 --key-name tanzu-operations-us-east-2 --user-data 'https://raw.githubusercontent.com/nycpivot/tanzu-operations/main/tmc-operations/scripts-initializer.sh' --output text --query "Instances[0].InstanceId")

public_dns=$(aws ec2 describe-instances --instance-ids $instance_id | jq "[.Reservations[].Instances[] | { PublicDnsName }]")

dns=$(eval "echo \${public_dns} | jq '.[] | .PublicDnsName'" | tr -d '"')

echo "Instance Id: " $instance_id
echo "Instance Dns: " $dns
echo http://169.254.169.254/latest/user-data

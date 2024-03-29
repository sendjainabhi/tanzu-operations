aws ec2 describe-images --region us-east-2 --owners self --output text --query 'Images[*].[ImageId]'

read -p "Input image: " image_Id

instance_id=$(aws ec2 run-instances --image-id $image_id --instance-type t3a.2xlarge --block-device-mappings '{"DeviceName": "/dev/sda1", "Ebs": {"DeleteOnTermination": true, "VolumeSize": 500}}' --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=tmc-operator-us-east-2}]' --security-group-ids tanzu-operations-us-east-2 --key-name tanzu-operations-us-east-2 --output text --query "Instances[0].InstanceId")

public_dns=$(aws ec2 describe-instances --instance-ids $instance_id | jq "[.Reservations[].Instances[] | { PublicDnsName }]")

dns=$(eval "echo \${public_dns} | jq '.[] | .PublicDnsName'" | tr -d '"')

aws s3 rm s3://tmc-operations/operator-instance-us-east-2.txt --recursive
echo $instance_id | aws s3 cp - s3://tmc-operations/operator-instance-us-east-2.txt
echo

echo "Operator Dns: " $dns
echo "User Data: http://169.254.169.254/latest/user-data"
echo

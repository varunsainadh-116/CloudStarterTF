# Public IP 
output "ec2_instance_ip" {
  value = aws_instance.ec2_instance.public_ip
}
output "ec2_instance_dns" {
  value = aws_instance.ec2_instance.public_dns
}
output "ec2_instance_id" {
  value = aws_instance.ec2_instance.id
}
output "ec2_instance_private_ip" {
  value = aws_instance.ec2_instance.private_ip
}

output "ec2_instance_ami" {
  value = aws_instance.ec2_instance.ami
}

output "ec2_instance_name" {
  value = aws_instance.ec2_instance.tags["Name"]

}
# AWS EC2 Instance KeyPair
resource "aws_key_pair" "deployer" {
  key_name   = "terr_ec2key"
  public_key = file("terr_ec2key.pub")
}

# aws default vpc network

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}
## AWS EC2 Instamce Secutity Group

resource "aws_security_group" "security_checks" {
  name        = "security_checks"
  description = "Security group for EC2 instance"
  vpc_id      = aws_default_vpc.default.id # interpolation to get the default VPC ID
  tags = {
    Name = "allow_tls"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls" {
  security_group_id = aws_security_group.security_checks.id
  ip_protocol       = "tcp"
  from_port         = 443 # Allow HTTPS traffic
  to_port           = 443
  cidr_ipv4         = "0.0.0.0/0"
  description       = "Allow TLS traffic"
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.security_checks.id
  ip_protocol       = "tcp"
  from_port         = 22 # Allow SSH traffic
  to_port           = 22
  cidr_ipv4         = "0.0.0.0/0"
  description       = "Allow SSH traffic"
}

resource "aws_vpc_security_group_egress_rule" "allow_https" {
  security_group_id = aws_security_group.security_checks.id
  ip_protocol       = "-1" # semantically equivalent to all ports
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 0
  to_port           = 0
  description       = "Allow all outbound traffic"
}

# AWS EC2 Instance
resource "aws_instance" "ec2_instance" {
  key_name        = aws_key_pair.deployer.key_name
  security_groups = [aws_security_group.security_checks.name]
  instance_type   = var.aws_instance_type
  ami             = var.aws_ami_id # Amazon Linux 2 AMI in Mumbai region
  user_data = file("user_data.sh") # Path to your user data script
  root_block_device {
    volume_size = var.aws_root_block_device_size
    volume_type = "gp3" # General Purpose SSD
  }
  tags = {
    Name = "MyEC2Instance"
  }
}
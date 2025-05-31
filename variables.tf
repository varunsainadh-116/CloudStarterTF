variable "aws_instance_type" {
  description = "Type of the AWS EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "aws_ami_id" {
  description = "AMI ID for the AWS EC2 instance"
  type        = string
  default     = "ami-0af9569868786b23a" # Amazon Linux 2 AMI in Mumbai region
}
variable "aws_root_block_device_size" {
  description = "Size of the root block device in GB"
  type        = number
  default     = 8
}

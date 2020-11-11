# variable "security_group_rds" {
#   description = "security group rds"
#   value=  
# }

variable "region" {
  default = "eu-west-1"
}

variable "vpc_id" {
  description = "the id of vpc to work on"
  default     = "vpc-0e6dbc4b641dac5e1"
}

data "aws_vpc" "custom_vpc" {
  id = var.vpc_id
}

data "aws_security_group" "custom_vpc_sg" {
  vpc_id = data.aws_vpc.custom_vpc.id
  name   = "default"
}

variable "admin_user" {
  default = "admin"
}

variable "db_name" {
  default = "yassir_example_database"
}

# output "vpc" {
#   value = data.aws_vpc.custom_vpc
# }



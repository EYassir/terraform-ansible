variable "region" {
  description = "region"
}

variable "security_group_rds" {
  description = "security group rds"
}

variable "admin_user" {
  description = "the admin user"
}

variable "db_name" {
  description = "database name"
}

variable "the_vpc" {
  description = "Vpc to use"
}

#subnet privé
data "aws_subnet_ids" "custom_vpc_subnets_ids" {
  vpc_id = var.the_vpc.id
  filter {
    name   = "tag:Name"
    values = ["private-*"]
  }
}

#
# Remote State variable
#
variable "state_bucket" {
  description = "bucket state"
}

variable "db_state_table" {
  description = "db state"
}

variable "encrypt_state" {
  description = "encrypt state"
}

variable "region" {
  description = "region"
}

variable "state_key_prefix" {
  description = "state key prefix"
}

#
# End Remote State variable
#
variable "image_id" {
  description = "The ami image"
}

variable "vpc_id" {
  description = "the id of vpc to work on"
}

variable "key_name" {
  description = "The key pair that will be used"
}
variable "key_value" {
  description = "The key pair that will be used"
}

variable "app_port" {
  default = 80
}

data "aws_vpc" "custom_vpc" {
  id = var.vpc_id
}

#subnet privé
data "aws_subnet_ids" "custom_vpc_subnets_ids" {
  vpc_id = data.aws_vpc.custom_vpc.id
  filter {
    name   = "tag:Name"
    values = ["private-*"]
  }
}



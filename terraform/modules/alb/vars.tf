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

variable "vpc_id" {
  description = "the id of vpc to work on"
}

data "aws_vpc" "custom_vpc" {
  id = var.vpc_id
}

#subnet public
data "aws_subnet_ids" "custom_vpc_subnets_ids" {
  vpc_id = data.aws_vpc.custom_vpc.id
  filter {
    name   = "tag:Name"
    values = ["public-sub-*"]
  }
}

variable "app_port" {
  description = "the port number of the web"
  type        = number
  default     = 80
}

variable "target_group_arn" {
  description = "arn of target"
}

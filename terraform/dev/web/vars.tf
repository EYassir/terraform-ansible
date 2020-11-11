variable "state_bucket" {
  default = ""
}

variable "db_state_table" {
  default = ""
}

variable "encrypt_state" {
  default = true
}

variable "region" {
  default = "eu-west-1"
}

variable "state_key_prefix" {
  default = "global"
}

variable "vpc_id" {
  description = "the id of vpc to work on"
  default     = ""
}

variable "key_name" {
  description = "The key pair that will be used"
  default     = "ansible-keypair"
}

variable "key_value" {
  default = ""
}

variable "image_id" {
  description = "The ami image"
  default     = "ami-06fd8a495a537da8b"
}

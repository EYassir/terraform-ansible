terraform {
  backend "s3" {
    bucket         = "terraform-fitec-bucket-state-irland-2"
    key            = "global/web/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-fitec-dynamodb-lock-irland"
    encrypt        = true
  }
}

module "asg_ansible" {
  source = "../../modules/asg"

  key_name         = "ansible-demo-keypair"
  key_value        = var.key_value
  region           = var.region
  encrypt_state    = var.encrypt_state
  db_state_table   = var.db_state_table
  state_bucket     = var.state_bucket
  state_key_prefix = var.state_key_prefix
  vpc_id           = var.vpc_id
  image_id         = var.image_id
}

module "alb_ansible" {
  source           = "../../modules/alb"
  region           = var.region
  encrypt_state    = var.encrypt_state
  db_state_table   = var.db_state_table
  state_bucket     = var.state_bucket
  state_key_prefix = var.state_key_prefix
  vpc_id           = var.vpc_id
  target_group_arn = module.asg_ansible.asg_taget_group
}


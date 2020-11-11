terraform {
  backend "s3" {
    bucket         = "terraform-fitec-bucket-state-irland-2"
    key            = "global/rds/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-fitec-dynamodb-lock-irland"
    encrypt        = true
  }
}

module "rds_ansible" {
  source             = "../../modules/rds"
  region             = var.region
  security_group_rds = data.aws_security_group.custom_vpc_sg.id
  admin_user         = var.admin_user
  db_name            = var.admin_user
  the_vpc            = data.aws_vpc.custom_vpc
}

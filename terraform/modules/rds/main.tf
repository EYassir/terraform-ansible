provider "aws" {
  region = "eu-west-1"
}

resource "aws_db_subnet_group" "rds_custom_subnet" {
  name       = "main"
  subnet_ids = data.aws_subnet_ids.custom_vpc_subnets_ids.ids

  tags = {
    Name = "My DB subnet group"
  }
}

#Create RDS DB
resource "aws_db_instance" "rds_eyassir_01" {
  allocated_storage       = 20
  storage_type            = "gp2"
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t2.micro"
  name                    = var.db_name
  username                = var.admin_user
  password                = "admin2020" //TODO #jsondecode(data.aws_secretsmanager_secret_version.db_password.secret_string)["dp_password"]
  parameter_group_name    = "default.mysql8.0"
  skip_final_snapshot     = true
  backup_retention_period = 7
  #backup_window           = "09:46-10:16"
  db_subnet_group_name = aws_db_subnet_group.rds_custom_subnet.id
}

#Edit default security group to add new rule 
resource "aws_security_group_rule" "allo_mysql_port" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = var.security_group_rds
}
# data "aws_secretsmanager_secret_version" "db_password" {
#   secret_id = data.aws_secretsmanager_secret.db_secret.id
# }
# data "aws_secretsmanager_secret" "db_secret" {
#   arn = "arn:aws:secretsmanager:eu-west-1:411953124370:secret:rds_pwd-IZXLtD"
# }



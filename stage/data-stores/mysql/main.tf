provider "aws" {
  region = "us-east-2"
}

resource "aws_db_instance" "example" {
  identifier_prefix   = "pd-terraform-lab-"
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "db.t2.micro"
  name                = "example_database"
  username            = "admin"
  skip_final_snapshot  = true

 password = data.aws_secretsmanager_secret_version.dbpassword.secret_string
}

data "aws_secretsmanager_secret_version" "dbpassword" {
secret_id = "dbpassword"

 }


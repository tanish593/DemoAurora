module "rds-aurora" {
  source  = "terraform-aws-modules/rds-aurora/aws"
  version = "7.6.2"
  name    = "tanish-testing-ab"
  engine_version = "14.5"
  engine            = "aurora-postgresql"
  engine_mode       = "provisioned"
  storage_encrypted = true
  instance_class    = "db.t3.medium"
  instances = {
    one = {}
    two = {}
  }
  vpc_id            = "vpc-0a1ffe8c66ad5e40d"
  subnets           = ["subnet-00d311a40de8858e7","subnet-0b2b71f8a62188145"]
  allowed_cidr_blocks = ["172.16.0.0/16"]
  create_security_group = true
  apply_immediately   = true
  monitoring_interval = 10

  db_parameter_group_name         = aws_db_parameter_group.tanish_mysql8.id
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.tanish_mysql8.id

  tags = {
    Environment = "tanish"
    Terraform   = "true"
  }
}

resource "aws_db_parameter_group" "tanish_mysql8" {
  name        = "aurora-db-mysql8-parameter-group"
  family      = "aurora-postgresql14"
  description = "aurora-db-mysql8-parameter-group"
  tags        = {
    name      = "tanish_cluster_parameter_group"
    region    = "us-east-2"
  }
}

resource "aws_rds_cluster_parameter_group" "tanish_mysql8" {
  name        = "aurora-mysql8-cluster-parameter-group"
  family      = "aurora-postgresql14"
  description = "aurora-mysql8-cluster-parameter-group"
  tags        = {
    name      = "tanish_cluster_parameter_group"
    region    = "us-east-2"
  }
}

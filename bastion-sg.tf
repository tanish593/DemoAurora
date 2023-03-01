# AWS EC2 Security Group Terraform Module
# Security Group for Public Bastion Host
module "bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.1"

  name = "public-bastion-sg"
  description = "Security Group with SSH port open for everybody (IPv4 CIDR), egress ports are all world open"
  vpc_id = "vpc-0a1ffe8c66ad5e40d"
  # Ingress Rules & CIDR Blocks
  ingress_rules = ["ssh-tcp","http-80-tcp", "https-443-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  # Egress Rule - all-all open
  egress_rules = ["all-all"]
  tags = {
    Environment = "tanish"
    Terraform   = "true"
  }
}

module "ec2_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.3.0"
  # insert the 10 required variables here
  name                   = "Tanish-BastionHost"
  ami                    = "ami-05bfbece1ed5beb54"
  instance_type          = "t2.micro"
  key_name               = var.key_pair

  subnet_id              = "subnet-071bf665d306c5191"
  vpc_security_group_ids = [module.bastion_sg.security_group_id]
  tags = {
    Environment = "tanish"
    Terraform   = "true"
  }
}

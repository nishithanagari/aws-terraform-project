#VPC creation using terraform

module "vpc" {
  source = "./module/vpc"
}

#VPC creation using terraform
module "instance" {
  source    = "./module/ec2"
  subnet_id = module.vpc.subnet_id
  vpc_id    = module.vpc.vpc_id
}

#VPC creation using terraform
module "S3" {
  source = "./module/S3"
}

#VPC creation using terraform
module "IAM" {
  source = "./module/IAM"
}
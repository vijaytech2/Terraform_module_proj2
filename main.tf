module "vpc_module_dev" {
  source ="./module-network"

}

module "my_ec2_instance" {
  source ="./module-EC2"
  ami_id = "ami-0f34c5ae932e6f0e4"
  subnet_id = module.vpc_module_dev.public_subnet_id[0]


}

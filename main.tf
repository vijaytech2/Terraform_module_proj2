module "vpc_module_dev" {
  source ="./module-network"
  public_cidr_block = ["10.0.0.0/24","10.0.1.0/24"]
}

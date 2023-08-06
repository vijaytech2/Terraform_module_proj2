variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "tags" {
  default = {
    Name = "dev02_vpc"
  }
}

#variable "count" {
#  default = ""
#}

variable "public_cidr_block" {
  default = ["10.0.0.0/24","10.0.1.0/24"]
}

variable "private_cidr_block" {
  default = ["10.0.1.0/24","10.0.2.0/24"]
}

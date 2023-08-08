# Create a new VPC

resource "aws_vpc" "vpc_custom_dev01" {
  cidr_block = var.vpc_cidr_block

  tags = var.tags

}

# Create a public subnet

resource "aws_subnet" "public" {
  count      = length(var.public_cidr_block)
  vpc_id     = aws_vpc.vpc_custom_dev01.id
  cidr_block = var.public_cidr_block[count.index]
  availability_zone = data.aws_availability_zones.az.names[count.index]
  tags = {
    Name = "public-${count.index + 1}"
  }

}

#Create IGW
resource "aws_internet_gateway" "igw_dev01" {

    vpc_id = aws_vpc.vpc_custom_dev01.id
}

#Create route table_mappings for puplic

resource "aws_route_table" "RT_dev01" {

    vpc_id = aws_vpc.vpc_custom_dev01.id

    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.igw_dev01.id
    }

    tags = {
      Name = "RT_dev01"
    }
}

# Associate route table with public

resource "aws_route_table_association" "public" {
  count = length(var.public_cidr_block)
  subnet_id = aws_subnet.public.*.id[count.index]
  route_table_id = aws_route_table.RT_dev01.id

}

#Create private subnet
resource "aws_subnet" "private" {
  count      = length(var.private_cidr_block)
  vpc_id     = aws_vpc.vpc_custom_dev01.id
  cidr_block = var.private_cidr_block[count.index]
  availability_zone = data.aws_availability_zones.az.names[count.index]
  tags = {
    Name = "private-${count.index + 1}"
  }

}

#Create NAT gateway
#resource "" "" {

#}

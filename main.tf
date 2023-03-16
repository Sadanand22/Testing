resource "aws_vpc" "Office_VPC" {
  cidr_block       = var.vpc_cidrblock
  instance_tenancy = "default"

  tags = {
    Name = "Sadanand-VPC"
  }
}
resource "aws_subnet" "Office_Public" {
  vpc_id                  = aws_vpc.Office_VPC.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.public_azs
  map_public_ip_on_launch = false

  tags = {
    Name = "Public_Subnet"
  }
}
resource "aws_internet_gateway" "office_IG" {
  vpc_id = aws_vpc.Office_VPC.id

  tags = {
    Name = "IG"
  }
}
resource "aws_route_table" "Office_RT" {
  vpc_id = aws_vpc.Office_VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.office_IG.id
  }

  tags = {
    Name = "Office_Network"
  }
}
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.Office_Public.id
  route_table_id = aws_route_table.Office_RT.id
}



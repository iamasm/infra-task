data "aws_availability_zones" "available" {
  state = "available"
}

//for now going to ignore 'count' for the subnets ans route table associations
//also going to use fixed cidr_blocks
//later can rewrite this with count/index references
//cidr_block could be obtained via cidrsubnet function call

resource "aws_subnet" "public1" {
  cidr_block = var.subnet_public1_cidr_block
  vpc_id = var.subnets_target_vpc_id
  availability_zone = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = false
  tags = var.subnets_tags
}

resource "aws_subnet" "private2" {
  cidr_block = var.subnet_private2_cidr_block
  vpc_id = var.subnets_target_vpc_id
  availability_zone = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = false
  tags = var.subnets_tags
}

resource "aws_subnet" "private4" {
  cidr_block = var.subnet_private4_cidr_block
  vpc_id = var.subnets_target_vpc_id
  availability_zone = data.aws_availability_zones.available.names[2]
  map_public_ip_on_launch = false
  tags = var.subnets_tags
}

resource "aws_route_table" "route_table_igw" {
  vpc_id = var.subnets_target_vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.subnets_target_vpc_igw_id
  }
  tags = var.subnets_tags
}

resource "aws_route_table" "route_table_natgw" {
  vpc_id = var.subnets_target_vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgw.id
  }
  tags = var.subnets_tags
}

resource "aws_route_table_association" "public1" {
  route_table_id = aws_route_table.route_table_igw.id
  subnet_id = aws_subnet.public1.id
}

resource "aws_route_table_association" "private2" {
  route_table_id = aws_route_table.route_table_natgw.id
  subnet_id = aws_subnet.private2.id
}

resource "aws_route_table_association" "private4" {
  route_table_id = aws_route_table.route_table_natgw.id
  subnet_id = aws_subnet.private4.id
}

resource "aws_eip" "natgw" {
  vpc  = true
  tags = var.subnets_tags
}

resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.natgw.id
  subnet_id = aws_subnet.public1.id
  tags = var.subnets_tags
}


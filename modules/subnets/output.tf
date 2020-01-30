output "public_subnet_id" {
  value = aws_subnet.public1.id
}

output "private_primary_subnet_id" {
  value = aws_subnet.private2.id
}

output "private_secondary_subnet_id" {
  value = aws_subnet.private4.id
}

output "public_cidr_block" {
  value = aws_subnet.public1.cidr_block
}

output "public_az" {
  value = aws_subnet.public1.availability_zone
}

output "private_primary_cidr_block" {
  value = aws_subnet.private2.cidr_block
}

output "private_primary_az" {
  value = aws_subnet.private2.availability_zone
}

output "private_secondary_cidr_block" {
  value = aws_subnet.private4.cidr_block
}

output "private_secondary_az" {
  value = aws_subnet.private4.availability_zone
}

output "natgw_id" {
  value = aws_nat_gateway.natgw.id
}

output "natgw_public_ip" {
  value = aws_nat_gateway.natgw.public_ip
}

output "natgw_private_ip" {
  value = aws_nat_gateway.natgw.private_ip
}
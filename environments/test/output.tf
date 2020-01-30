# Create helpful outputs here..

output "vpc_id"   { value = module.vpc.vpc_id }
output "vpc_cidr" { value = module.vpc.vpc_cidr }
output "vpc_igw_id" { value = module.vpc.vpc_igw_id }

output "subnet_public_id" { value = module.subnets.public_subnet_id }
output "subnet_public_cidr_block" { value = module.subnets.public_cidr_block }
output "subnet_publc_az" { value = module.subnets.public_az }

output "subnet_private_primary_id" { value = module.subnets.private_primary_subnet_id }
output "subnet_private_primary_cidr_block" { value = module.subnets.private_primary_cidr_block }
output "subnet_private_primary_az" { value = module.subnets.private_primary_az }

output "subnet_private_secondary_id" { value = module.subnets.private_secondary_subnet_id }
output "subnet_private_secondary_cidr_block" { value = module.subnets.private_secondary_cidr_block }
output "subnet_private_secondary_az" { value = module.subnets.private_secondary_az }

# output for app public ip address..?
output "app_public_ip" { value = module.app.app_public_ip }
output "app_private_ip" {  value = module.app.app_private_ip }
output "app_fqdn" { value = module.app.app_fqdn }

output "mongodb_private_ip" { value = module.mongodb.mongo_private_ip }
output "url_to_test" {
  value = "http://${module.app.app_fqdn}:8080/test.htm"
}
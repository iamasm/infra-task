output "mongo_private_ip" {
  value = aws_instance.ec2_mongodb.private_ip
}

output "mongo_key_pair_name" {
  value = aws_key_pair.provisioning_key.key_name
}
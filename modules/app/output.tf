output "app_public_ip" {
  value = aws_instance.ec2_app.public_ip
}

output "app_private_ip" {
  value = aws_instance.ec2_app.private_ip
}

output "app_fqdn" {
  value = aws_instance.ec2_app.public_dns
}

output "app_sg_id" {
  value = aws_security_group.sg_app.id
}
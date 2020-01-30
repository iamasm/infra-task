data "aws_ami" "ami_app" {
  owners = ["099720109477"] # Canonical
  filter {
    name   = "image-id"
    values = [var.app_ami]
  }
}

resource "aws_instance" "ec2_app" {
  ami = data.aws_ami.ami_app.id
  instance_type = var.app_instance_type
  subnet_id = var.app_subnet
  vpc_security_group_ids = [aws_security_group.sg_app.id]
  key_name = var.app_provisioning_key
  associate_public_ip_address = var.app_associate_public_ip_address
  user_data = templatefile("${path.module}/templates/user_data.tpl", { mongo_address = var.app_mongo_address})
  root_block_device {
    delete_on_termination = true
  }
  tags = var.app_tags
}

resource "aws_security_group" "sg_app" {
  name = "App Security Group"
  description = "the app sg"
  vpc_id = var.app_vpc_id
}

resource "aws_security_group_rule" "sg_rule_allow_http" {
  description = "Allow tcp traffic on port 8080"
  cidr_blocks = var.app_ingress_cidr_blocks
  from_port = 8080
  protocol = "tcp"
  security_group_id = aws_security_group.sg_app.id
  to_port = 8080
  type = "ingress"
}

resource "aws_security_group_rule" "sg_rule_allow_ssh" {
  description = "allow ssh to trobleshoot and as a jumpbox to mongodb instance"
  cidr_blocks = var.app_ingress_cidr_blocks
  from_port = 22
  protocol = "tcp"
  security_group_id = aws_security_group.sg_app.id
  to_port = 22
  type = "ingress"
}

resource "aws_security_group_rule" "sg_rule_allow_egress" {
  description = "Allow egress traffic"
  cidr_blocks = var.app_egress_cidr_blocks
  from_port = 0
  protocol = "-1"
  security_group_id = aws_security_group.sg_app.id
  to_port = 65535
  type = "egress"
}
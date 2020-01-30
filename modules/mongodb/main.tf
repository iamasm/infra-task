data "aws_ami" "ami_mongodb" {
  owners = ["099720109477"] # Canonical
  filter {
    name   = "image-id"
    values = [var.mongo_ami]
  }
}

resource "aws_key_pair" "provisioning_key" {
  key_name = "provisioning_key"
  public_key = var.mongo_provisioning_key
}

resource "aws_instance" "ec2_mongodb" {
  ami = data.aws_ami.ami_mongodb.id
  instance_type = var.mongo_instance_type
  subnet_id = var.mongo_subnet
  vpc_security_group_ids = [aws_security_group.sg_mongodb.id]
  key_name = aws_key_pair.provisioning_key.key_name
  user_data = templatefile("${path.module}/files/user_data.sh", {})
  root_block_device {
    volume_size = var.mongo_volume_size
    volume_type = var.mongo_volume_type
    delete_on_termination = true
  }
  tags = var.mongo_tags
}

resource "aws_security_group" "sg_mongodb" {
  name = "Mongodb host security group"
  description = "the mongodb sg"
  vpc_id = var.mongo_vpc_id
}

resource "aws_security_group_rule" "sg_rule_allow_mongodb" {
  description = "Allow connections to mongodb from the app host"
  source_security_group_id = var.mongo_app_sg
  from_port = 27017
  protocol = "tcp"
  security_group_id = aws_security_group.sg_mongodb.id
  to_port = 27017
  type = "ingress"
}

resource "aws_security_group_rule" "sg_rule_allow_ssh" {
  description = "Allow ssh connections from the app host for troubleshooting"
  source_security_group_id = var.mongo_app_sg
  from_port = 22
  protocol = "tcp"
  security_group_id = aws_security_group.sg_mongodb.id
  to_port = 22
  type = "ingress"
}

resource "aws_security_group_rule" "sg_rule_allow_egress" {
  description = "Allow egress traffic"
  cidr_blocks = var.mongo_egress_cidr_blocks
  from_port = 0
  protocol = "-1"
  security_group_id = aws_security_group.sg_mongodb.id
  to_port = 65535
  type = "egress"
}
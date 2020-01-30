variable "mongo_count" {
  description = "How many mongodb instances to create."
  type = number
}

variable "mongo_ami" {
  description = "The ami to use for the mongodb instance."
}

variable "mongo_instance_type" {
  description = "The instance type to use for the mongodb instance."
}

variable "mongo_vpc_id" {
  description = "VPC to put the mongodb instance"
}

variable "mongo_subnet" {
  description = "subnet to put the mongodb instance"
}

variable "mongo_app_sg" {
  description = "securty group to assign to mongodb instance"
  default = ""
}

variable "mongo_volume_type" {
    description = "The volume type to use for data storage on the mongodb instance."
    default = "gp2"
}

variable "mongo_volume_size" {
    description = "The volume size to use for the mongodb instance."
    default = 10
}

variable "mongo_provisioning_key" {
  description = "the SSH key to access mongodb instance"
}

variable "mongo_tags" {
  description = "Tags for mongodb instance"
  default = {}
}

variable "mongo_egress_cidr_blocks" {
  description = "destination to allow egress traffic"
  default = ["0.0.0.0/0"]
}

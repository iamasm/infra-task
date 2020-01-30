variable "app_ami" {
  description = "The ami to use for the application instance."
}

variable "app_instance_type" {
  description = "The instance type to use for the application instance."
}

variable "app_vpc_id" {
  description = "VPC to put the app instance"
}

variable "app_subnet" {
  description = "subnet to put the app instance"
}

variable "app_provisioning_key" {
  description = "the SSH key to access the app instance"
}

variable "app_associate_public_ip_address" {
  description = "the public elastic IP for app"
}

variable "app_tags" {
  description = "Tags for the app instance"
  default = {}
}

variable "app_ingress_cidr_blocks" {
  description = "where from to allow ingress traffic"
  default = ["0.0.0.0/0"]
}

variable "app_egress_cidr_blocks" {
  description = "destination to allow egress traffic"
  default = ["0.0.0.0/0"]
}

variable "app_mongo_address" {
  description = "mongodb ip addr to connect"
}


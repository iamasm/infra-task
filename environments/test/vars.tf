#################################################
# Variables for general properties
#################################################
variable "candidate_name" {
    description = "Hey! Thanks for working on this sample project. Let's start with your name."
    default = "Alex Mozgovoy"
}

variable "environment" {
    description = "The environment to use for this infrastructure deployment. In this case, we'll juset use 'Test'"
    default = "Test"
}

variable "provisioning_key" {
    description = "A key that can be used to connect and provision instances in AWS."
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCadOVuCQu7y4Y8PedvYa0ZX2vZLTQdLwlZzkzq4vr5L8aEMMmP3MxkVyMBxJqEEVphIpbNmIXV7MbYRpvZAOPs8kWadCRJCHJgvOv0DW82vHyV8x+rTD52nGsUfW9iIxnl7jn/rg+bz1cUknotztb+riAUEa0fC8uqtaD2qr6NkM2+FBnC0QLWt4NIpPE8k6lOSAj6ARJwWKJn3ribAM00cvP6rVBMPRnC42l1vsdpyYpv3bkeKn46AG9nf2+qOKXEyUsDl27ogFP4w2eIZhfLHwWBXGIFnam5jw2VIMHvn2fTU6Xh5a/tr/Hl8YlS+XCsGsjEMd4T+WD9Wx5HGnFdmW1mE2J/HwHhHs8oQmLZJP5vB3hV7MqsTaRNg353PfoMISgk+yIh8eFhq7AeYD6haSXqZgD7osJei5RzuyAQkOZFJaSJ/c2vyQuW7NxKOWeowI+AU+b/zdof/5z9ukCzHrmN+tnUIS+sS3fV0e4zCc/JulcCEHVxIrzET7Dta6rCkJKsmuiuwV0wgintFpNwvpaVE/Cyl5O7K7stm5Ih5Dg8yo+TFQzypVnKoKFLX6fWKP/C0xDS6t6pkiee2UGZqbX37q9bhJ35F2fyo78gmMNWfOUYdBukniuZUHqyR3lQ+VmYPjrVF9dxoUalwgoJaB9mwcy0VdTGzhQtpi5RnQ== amozgovoy@me.com"
}

#################################################
# Variables for building out a VPC
#################################################
variable "vpc_name" {
    description = "Name of the VPC. Examples include 'prod', 'dev', 'mgmt', etc."
    default = "terraform-aws-vpc-hiring"
}

variable "vpc_cidr" {
    description = "The IP address range of the VPC in CIDR notation."
    default = "10.9.0.0/16"
}

variable "vpc_enable_dns_hostnames" {
    description = "A boolean flag to enable/disable DNS hostnames in the VPC. Defaults false."
    default = true
}

variable "vpc_enable_dns_support" {
    description = "A boolean flag to enable/disable DNS support in the VPC. Defaults true."
    default = true
}

variable "vpc_create_internet_gateway" {
    description = "A boolean flag to enable/disable the creation of an Internet Gateway"
    default = true
}

#################################################
# Variables for setting up subnets and routing
#################################################
variable "subnets_az_state_filter" {
    description = "This value can be used to filter Availability Zones to use when setting up network resources. Let's only use available AZs as *data* sources"
    default = "available"
}

variable "subnets_private_count" {
    description = "How many private subnets to make."
    default = 2
}

variable "subnets_public_count" {
    description = "How many public subnets to make. Just 1 is required for a NAT Gateway."
    default = 1
}

variable "subnets_enable_nat_gateway" {
    description = "A boolean flag to enable/disable the creation of a NAT Gateway."
    default = true
}

#################################################
# Variables for setting up a MongoDB instance
#################################################
variable "mongo_count" {
    description = "How many mongodb instances to create."
    default = 1
}

variable "mongo_ami" {
    description = "The ami to use for the mongodb instance. Here we're just using an Ubuntu 14.04 LTS public image."
    default = "ami-07ebfd5b3428b6f4d" # 14.04 is no longer supported, going to use 18.04
}

variable "mongo_instance_type" {
    description = "The instance type to use for the mongodb instance."
    default = "t2.small"
}

variable "mongo_volume_type" {
    description = "The volume type to use for data storage on the mongodb instance."
    default = "gp2"
}

variable "mongo_volume_size" {
    description = "The volume size to use for the mongodb instance."
    default = 10
}

#################################################
# Variables for setting up an App instance
#################################################
variable "app_ami" {
    description = "The ami to use for the application instance. Here we're just using an Ubuntu 14.04 LTS public image."
    default = "ami-07ebfd5b3428b6f4d"
}

variable "app_instance_type" {
    description = "The instance type to use for the application instance."
    default = "t2.small"
}

variable "app_associate_public_ip_address" {
    description = "Associate a public ip address with an instance in a VPC. Boolean value."
    default = true
}

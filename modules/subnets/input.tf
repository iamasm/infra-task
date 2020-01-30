# Subnet Module Input Variables

variable "subnets_target_vpc_id" {
    description = "The VPC id for subnets"
}

variable "subnets_target_vpc_igw_id" {
    description = "The Internet Gateway id for subnets"
}

variable "subnets_az_state_filter" {
    description = ""
}

variable "subnets_private_count" {
    description = "Number of private subnets"
    type = number
    default = 2
}

variable "subnets_public_count" {
    description = "Number of public subnets"
    type = number
    default = 1
}

variable "subnets_enable_nat_gateway" {
    description = "if true, create the NAT gateway"
}

variable "subnets_tags" {
    description = "Additional tags for the subnets"
    default     = {}
}

variable "subnet_public1_cidr_block" {
    description = "cidr_block for public1 subnet"
    default     = "10.9.1.0/24"
}

variable "subnet_private2_cidr_block" {
    description = "cidr_block for private2 subnet"
    default     = "10.9.2.0/24"
}

variable "subnet_private4_cidr_block" {
    description = "cidr_block for private4 subnet"
    default     = "10.9.4.0/24"
}

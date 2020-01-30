
# NOTE: Setting a required version to help with compatibility
terraform {
    backend "local" {
        path = "./terraform.tfstate"
    }
    required_version = ">= 0.12"
}

# Configure the AWS Provider
provider "aws" {
    version = "~> 2.38"
    profile = "default"
    region  = "us-east-1"
}

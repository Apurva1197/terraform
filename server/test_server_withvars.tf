terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.61.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = var.region
}

##### Try to create one ubuntu server
resource "aws_instance" "this" {
  ami                     = var.ami
  instance_type           = var.instance_type
  key_name                = var.key_name

  tags = var.tags

}

output "EC2" {
  value = var.value 
}



######################################
# Now we are calling the variables

variable "region" {
  default = "ap-south-1"
  description = "region calling"
}

variable "ami" {
  default = "ami-0ad21ae1d0696ad58"
  description = "ami calling"
}

variable "instance_type" {
  default = "t2.medium"
  description = "server size calling"
}

variable "key_name" {
  default = "hybrid"
  description = "key calling"
}

variable "tags" {
  type = map
  default = {
    Enviorment = "staging"
    owner = "jarvis"    
  }
}

variable "value" {
  default = "Here we are trying to create machine"
  description = "output block calling"
}




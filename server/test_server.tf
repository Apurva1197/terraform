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
  region = "ap-south-1"
}

##### Try to create one ubuntu server
resource "aws_instance" "this" {
  ami                     = "ami-0ad21ae1d0696ad58"
  instance_type           = "t2.micro"
  key_name                = "nishad"
  tags = {
    Enviorment = "staging"
    owner = "jarvis"    
  }
  

}

output "EC2" {
  value = "here we are trying to create server"
}











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
resource "aws_instance" "this{
  ami                     = "ami-0ad21ae1d0696ad58"
  instance_type           = "t2.micro"
  key_name                = "nishu"

  tags = {
#     Enviorment = "staging"
#     owner = "jarvis"    
#   }

}

output "EC2" {
  value = "here we are trying to create server"
}











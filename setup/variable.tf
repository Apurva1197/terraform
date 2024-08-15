#variable block calling all values
variable "region" {
    # default = "ap-south-1"
    description = "region calling"
}

variable "ami" {
    # default = "ami-0ad21ae1d0696ad58"
    description = "calling ami"
}

variable "instance_type" {
#   default = "t2.micro"
  description = "calling instance type"
}

variable "aws_key_name_id" {
    # default = "hybrid"
    description = "calling key-pair"
}

variable "aws_security_group_id" {
    # default = "hybrid"
    description = "calling security-group"
}


variable "tags" {
    type = map
#     # default = {
#     # Name = "Development-server"
#     # Enviorment = "staging"
#     # Owner = "jarvis"
#     # }
}

region = "us-east-1"
ami = "ami-0ad21ae1d0696ad58"
instance_type = "t2.micro"
key_name = "nishthu"
# security_groups = "terraform-sg"
tags  =  {
    Name       = "Development-server"
    Enviorment = "staging"
    Owner      = "jarvis"    
}
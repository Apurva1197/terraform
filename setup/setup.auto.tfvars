region = "us-east-1"
ami = "ami-04a81a99f5ec58529"
instance_type = "t2.micro"
key_name = "nishthu"
# security_groups = "terraform-sg"
tags  =  {
    Name       = "Development-server"
    Enviorment = "staging"
    Owner      = "jarvis"    
}
region = "us-east-1"
ami = "ami-0ad21ae1d0696ad58"
instance_type = "t2.micro"
key_name = "deployer"
security_groups = 
tags  =  {
    Name       = "Development-server"
    Enviorment = "staging"
    Owner      = "jarvis"    
}
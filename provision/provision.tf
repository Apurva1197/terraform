
 resource "aws_instance" "this_aws_instance" {
    ami = "ami-0ad21ae1d0696ad58"
    vpc_security_group_ids = ["sg-0d05c3fc8cadd1926"]
    key_name = "nishad"
    instance_type = "t2.micro"
 
     provisioner "file" {
    source      = "readme.md"
    destination = "/home/ubuntu/readme.md"
      
  
  }
   provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt "
  }
  
    connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file ("nishad.pem")
    host     = self.public_ip
  }
  
 provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",               # Update package index
      "sudo apt install nginx -y",        # Install Nginx
      "sudo systemctl start nginx",       # Start Nginx service
      "sudo systemctl enable nginx"       # Enable Nginx to start on boot
    ]
  }
 }
  
  
  
 
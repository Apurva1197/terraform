
 resource "aws_instance" "this_aws_instance" {
    ami = "ami-0ad21ae1d0696ad58"
    
    key_name = "nishad"
    instance_type = "t2.micro"
 
     provisioner "file" {
    source      = "readme.md"
    destination = "/home/ubuntu/readme.md"
      connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file ("nishad.pem")
    host     = "${self.public_ip}"
  }
  
  
  }
   provisioner "local-exec" {
    command = "echo ${self.private_ip} >> /tmp/private_ips.txt "
  }
    provisioner "local-exec" {
    working_dir = "/tmp/"
    command = "echo ${self.private_ip} >> workingdir_private_ips.txt "
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
  
  
  
 
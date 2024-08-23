 
  resource "aws_instance" "this_aws_instance" {
    //for_each = toset(var.imageid)
    ami = "ami-0ad21ae1d0696ad58"
    
    key_name = "delete_oregon_anup"
    instance_type = "t2.micro"
     provisioner "file" {
    source      = "hello.txt"
    destination = "/home/ec2-user/aws/"
  }
   provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
  }
    connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = "ec2-private"
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "yum install httpd -y",
      "systemctl start httpd",
      "systemctl enable httpd"
    ]
  }
    
}  
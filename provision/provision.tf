 
  resource "aws_instance" "this_aws_instance" {
    //for_each = toset(var.imageid)
    ami = "ami-0ad21ae1d0696ad58"
    key_name = "nishad"
    instance_type = "t2.micro"
   provisioner "file" {
    source      = "/home/ubuntu/script.sh"
    destination = "/media/"
  }
   provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
  }
    connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = "nishad"
    host     = "self.65.0.97.239"
  }

  provisioner "remote-exec" {
    inline = [
      "yum install httpd -y",
      "systemctl start httpd",
      "systemctl enable httpd"
    ]
  }
    
}  
# S3 Bucket
resource "aws_s3_bucket" "terraform-state" {
  bucket = "terraform-state-bucket-cdec-b37"
}

resource "aws_s3_bucket_versioning" "terraform-state" {
  bucket = aws_s3_bucket.terraform-state.id
  versioning_configuration {
    status = "Enabled"
  }
}

# State locking using dynamodb
resource "aws_dynamodb_table" "state_lock_table" {
  name           = "terraform_state_lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}




# resource block for key creation
resource "aws_key_pair" "deployer" {
  key_name   = deployer_key
  public_key = ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC2+nVAxv17L5aFw7BPOaw+lLcwpplKgj5RRJmoq16OS2mzybzjsib5nfZsbiYm1MabMtixkUPQk0JW+24hJlnFVsxAb58yseXCu3w0DhFQ0FM92NJU+U3aGeQKFxECoiwTER9zCDxpv6cwz4v7LG3HBGT6EeUM0f3WsyGRBLHEFtZqa5BS+I5tKkZUlrNclaF9GX3hwE98hOX7nNKSiagmQ0rxagSycGFQjXdXugRTCrE2hDI18HLxHYMLKC+d3T+MgbL0IrdjAXuh3/EVnU3IPk5tiVulQf9XwBtkyBykvnCixturQq+TdoOybYIXwoa4AWvtEolRLsgtcbj3qmtr nishu


}

#resource block for security group creation
resource "aws_security_group" "terraform_sg" {
  name        = "terraform_sg"
  description = "Allow sg inbound traffic"
  dynamic "ingress" {
    for_each = [80,22,8080,3306]
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

# data block for sg
data "aws_security_group" "terraform_sg" {
  id = var.aws_security_group_id
}

# data block for key
data "aws_key_pair" "deployer" {
  id = var.aws_key_pair_id
}
# resource block for server creation
resource "aws_instance" "server_1" {
    ami            = var.ami
    instance_type  = var.instance_type
    tags           = var.tags
    key_name       = data.aws_key_pair.deployer.key_name
    security_group = data.aws_security_group.terraform_sg.id
    user_data      = file("${path.module}/home/ubuntu/terrascript.sh")

}





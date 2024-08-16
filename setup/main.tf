# S3 Bucket
resource "aws_s3_bucket" "terraform-state" {
  bucket = "terraform-buckettt"
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




# # resource block for key creation
# resource "aws_key_pair" "deployer" {
#   key_name   = "deployer"
#   public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF3jdowZJ/fBcqKaNUhhcgwlsyw6wa1f9FN+aw1ye63U"
# }


#resource block for security group creation
# resource "aws_security_group" "terraform-sg" {
#   name        = "terraform-sg"
#   description = "Allow sg inbound traffic"
#   dynamic "ingress" {
#     for_each = [80,22,8080,3306]
#     iterator = port
#     content {
#       from_port   = port.value
#       to_port     = port.value
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#     }
#   }
  
# }

# resource block for server creation
resource "aws_instance" "server_1" {
    ami            = var.ami
    instance_type  = var.instance_type
    tags           = var.tags
    key_name       = var.key_pair
    #security_group = var.security_group
    


}





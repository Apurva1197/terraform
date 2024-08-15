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
  public_key = 
}

#resource block for security group creation
resource "aws_security_group" "terraform_sg" {
  name        = "terraform_sg"
  description = "Allow sg inbound traffic"
  dynamic "ingress" {
    for_each = [80,22,8080,330]
    iterator = port
    content {
      description = "TLS from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

# resource block for server creation
resource "aws_instance" "server_1" {
    ami           = var.ami
    instance_type = var.instance_type
    tags          = var.tags
    key_name      = aws_key_pair.deployer.key_name
    security

}





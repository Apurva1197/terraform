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


# resource block for server creation
resource "aws_instance" "server_1" {
    ami = var.ami
    instance_type = var.instance_type
    tags = var.tags
}

# resource block for key creation
resource "aws_key_pair" "deployer" {
  key_name   = deployer_key
  public_key = 
}

#resource bloc
resource "aws_security_group" "sg-webserver" {
    vpc_id              = aws_vpc.vpc.id
    name                = "webserver"
    description         = "Security Group for Web Servers"

    dynamic "ingress" {
        for_each = local.inbound_ports
        content {
            from_port   = ingress.value
            to_port     = ingress.value
            protocol    = "tcp"
            cidr_blocks = [ "0.0.0.0/0" ]
        }
    }





provider "aws" {
  region = "eu-central-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

# EC2 instance
resource "aws_instance" "terraform_ec2_instance" {
  ami           = "ami-00cf59bc9978eb266"
  instance_type = "t2.micro"

  tags = {
    Name        = "robotdreams-terraform-jb-ec2-instance"
  }
}

# S3 Bucket
resource "aws_s3_bucket" "terraform_s3_bucket" {
  bucket = "robotdreams-terraform-jb-s3-bucket"
}

output "terraform_ec2_instance_id" {
  value = aws_instance.terraform_ec2_instance.id
}

output "terraform_s3_bucket" {
  value = aws_s3_bucket.terraform_s3_bucket.bucket
}
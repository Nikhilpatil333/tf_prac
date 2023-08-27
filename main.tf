terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  access_key = "ASIAZ627RA3QO2KEVRKB"	
  secret_key = "xo+v1ZZbMVDQAWYt7VRhV8PP+nQOWo4sIeLO0VJz"
  
}

resource "aws_s3_bucket" "bucket" {
  bucket = "terraform-nikhil-prac"

  tags = {
    Name = "My bucket"
  }
}

# for uploading a file into a bucket

resource "aws_s3_bucket_object" "file" {
  bucket = aws_s3_bucket.bucket.id
  key    = "hello.txt"
  source = "D:/DBDA/terrorform/hello.txt"
}
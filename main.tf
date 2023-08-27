
resource "aws_s3_bucket" "bucket" {
  bucket = "terraform-nikhil-prac"

  tags = {
    Name = "My bucket"
  }
}

# for uploading a file into a bucket

resource "aws_s3_object" "file" {
  bucket = aws_s3_bucket.bucket.id
  key    = "hello.txt"
  source = "D:/DBDA/terrorform/hello.txt"
}
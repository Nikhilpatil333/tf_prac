#Creating bucket

resource "aws_s3_bucket" "bucket" {
  bucket = "terraform-nikhil-prac"

  tags = {
    Name = "My bucket"
  }
}


#======================================

# variable "job-language" {
#     default = "python"
# }

# variable "bucket-name" {
#     default = "terraform-nikhil-prac"
# }

# variable "glue-arn" {
#     default = ""
# }

# variable "job-name" {
#     default = "NYC-dataset-Processing"
# }

# variable "file-name" {
#     default = ""
# }


#============================


# for uploading a pyspark file into a bucket

resource "aws_s3_object" "upload-glue-script" {
  bucket = aws_s3_bucket.bucket.id
  key    = "< FILE NAME >"
  source = "< FILE PATH >"
}

resource "aws_glue_job" "glue_job" {
  name = "NYC-dataset-processing"
  role_arn = "< arn >"
  description = "This is script to convert dataset"
  max_retries = "1"
  timeout = 2880
  command {
    script_location = "s3://terraform-nikhil-prac/< FILE NAME >"
    python_version = "3"
  }
  execution_property {
    max_concurrent_runs = 2
  }
  glue_version = "4.0"
  
}

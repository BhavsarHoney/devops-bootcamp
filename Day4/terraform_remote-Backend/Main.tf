resource "aws_s3_bucket" "example" {
  bucket = "bucket-terraform-state-hani"
   tags = {
    Name        = "bucket-terraform-state-hani"
    Environment =  var.environment
    Owner      = "Haniben.Bhavsar@einfochisp.com"
}
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.example.id
  versioning_configuration {
    status = "Enabled"
  }
}

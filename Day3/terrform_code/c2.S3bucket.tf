#Resource Block
resource "aws_s3_bucket" "example" {
  bucket = "bootcampbuckets3"

  tags = {
    Name        = "bootcampbuckets3"
    Environment = "Dev"
  }
}
#output block
output "S3_bucket_name" {
  value = aws_s3_bucket.example.bucket
}

output "S3_bucket_id" {
  value = aws_s3_bucket.example.id
}

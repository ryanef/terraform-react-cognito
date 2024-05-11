output "bucket_name" {
  value = aws_s3_bucket.site.id
}

output "bucket_arn" {
  value = aws_s3_bucket.site.arn
}

output "bucket_domain" {
  value = aws_s3_bucket.site.website_endpoint
}

output "regional_domain" {
  value = aws_s3_bucket.site.bucket_regional_domain_name
}
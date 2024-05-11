output "user_pool_id" {
  value = module.cognito.user_pool_id
}

output "s3_name" {
  value = module.s3.bucket_name
}

output "user_pool_client_id" {
  value = module.cognito.user_pool_client_id
}

output "api_gw_url" {
  value = trimsuffix(module.apigw.api_gw_url, "/")
}

output "cloudfront_url" {
  value = module.cloudfront.cloudfront_url
}

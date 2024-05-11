module "apigw" {
  source = "./apigw"

  name = "${var.name}_apigw"
  dynamodb_table_name = module.dynamodb.dynamodb_table_name
  dynamodb_table_arn = module.dynamodb.dynamodb_table_arn
  user_pool_arn = module.cognito.user_pool_arn
}

module "cloudfront" {
  source = "./cloudfront"

  bucket_arn = module.s3.bucket_arn
  bucket_name = module.s3.bucket_name
  regional_domain = module.s3.regional_domain
}

module "cognito" {
  source = "./cognito"

  dynamodb_table_name = module.dynamodb.dynamodb_table_name
  dynamodb_table_arn = module.dynamodb.dynamodb_table_arn
}

module "dynamodb" {
  source = "./dynamodb"
  
  table_name = "${var.name}_user_table"
}

module "s3" {
  source = "./s3"

  bucket_name = "${var.name}-${var.environment}-bucket"
}
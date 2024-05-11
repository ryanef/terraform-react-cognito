
output "api_gw_arn" {
  value = aws_api_gateway_rest_api.api.execution_arn
}

output "api_gw_url" {
  value = aws_api_gateway_deployment.api.invoke_url
}

output "api_gw_id" {
  value = aws_api_gateway_rest_api.api.id
}

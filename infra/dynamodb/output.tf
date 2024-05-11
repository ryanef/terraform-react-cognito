output "dynamodb_table_name" {
  value = aws_dynamodb_table.dynamodb-table.name
}

output "dynamodb_table_arn" {
  value = aws_dynamodb_table.dynamodb-table.arn
}

output "dynamodb_table_id" {
  value = aws_dynamodb_table.dynamodb-table.id
}
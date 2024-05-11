variable "dynamodb_table_arn" {
  default = null
  type = string
}

variable "dynamodb_table_name" {
  default = null
  type = string
}

variable "name" {
  default = "cogneatoapigw"
  type = string
}

variable "user_pool_arn" {
  type = string
  default = null
}
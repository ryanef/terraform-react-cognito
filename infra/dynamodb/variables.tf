variable "billing_mode" {
  default = "PAY_PER_REQUEST"
  type = string
  description = "PROVISIONED or PAY_PER_REQUEST"
}

variable "hash_key" {
  default = "pk"
  type = string
}

variable "range_key" {
  default = "sk"
  type = string
}

variable "table_name" {
  type = string
  description = "userTable"
}
variable "allowed_oauth_flows" {
  description = "code, implicit, client_credentials"
  default = null
  type = list(string)
}

variable "allowed_oauth_flows_user_pool_client" {
  description = "Whether the client is allowed to follow the OAuth protocol when interacting with Cognito user pools"
  default = null
  type = bool
}

variable "allowed_oauth_scopes" {
  default = null
  description = "phone, email, openid, profile, and aws.cognito.signin.user.admin"
}

variable "explicit_auth_flows" {
  description = "ADMIN_NO_SRP_AUTH, CUSTOM_AUTH_FLOW_ONLY, USER_PASSWORD_AUTH, ALLOW_ADMIN_USER_PASSWORD_AUTH, ALLOW_CUSTOM_AUTH, ALLOW_USER_PASSWORD_AUTH, ALLOW_USER_SRP_AUTH, ALLOW_REFRESH_TOKEN_AUTH"
  default = null
  type = list(string)
}

variable "dynamodb_table_arn" {
  default = null
  type = string
}

variable "dynamodb_table_name" {
  default = null
  type = string
}

variable "generate_secret" {
  default = false
  type = bool
}

variable "read_attributes" {
  default = null
  description = "phone_number, email, family_name, given_name, preferred_username, custom:attribute_name"
  type = list(string)
}

variable "userpool_name" {
  default = "TFuserPool"
}

variable "write_attributes" {
  default = null
  description = "phone_number, email, family_name, given_name, preferred_username, custom:attribute_name"
  type = list(string)
}




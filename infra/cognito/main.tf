resource "aws_cognito_user_pool" "main" {
  name = "${var.userpool_name}"

  auto_verified_attributes = ["email"]
  username_attributes = ["email"]

  user_attribute_update_settings {
    attributes_require_verification_before_update = ["email"]
  }

   verification_message_template {
    default_email_option = "CONFIRM_WITH_CODE"
  }

  email_configuration {
    email_sending_account = "COGNITO_DEFAULT"
  }

  schema {
    attribute_data_type = "String"
    mutable             = true
    name                = "name"
    required            = true
  }

  # schema {
  #   attribute_data_type = "String"
  #   mutable             = true
  #   name                = "email"
  #   required            = true
  # }
  # schema {
  #   attribute_data_type = "Number"
  #   mutable             = true
  #   name                = "phone_number"
  #   required            = true
  # }

  password_policy {
    minimum_length    = "8"
    require_numbers   = true
    require_symbols   = false
    require_uppercase = false
  }

  mfa_configuration        = "OFF"
  
  lambda_config {
    post_confirmation = aws_lambda_function.lambda.arn
  }

}


resource "aws_cognito_user_pool_client" "client" {
  name = "${var.userpool_name}-client"

  user_pool_id = "${aws_cognito_user_pool.main.id}"
  generate_secret = var.generate_secret
  allowed_oauth_flows = var.allowed_oauth_flows
  allowed_oauth_flows_user_pool_client = var.allowed_oauth_flows_user_pool_client
  allowed_oauth_scopes = var.allowed_oauth_scopes
  explicit_auth_flows  = var.explicit_auth_flows
  refresh_token_validity = 4
  access_token_validity  = 1
  id_token_validity      = 1
  read_attributes = var.read_attributes
  write_attributes = var.write_attributes
}

resource "aws_lambda_function" "lambda" {

  filename      = "${path.root}/python-code/zip/confirm_signup.zip"
  function_name = "confirm_signup"
  role          = aws_iam_role.lambda.arn
  handler       = "confirm_signup.handler"

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = "python3.10"

  environment {
    variables = {
      DYNAMODB_TABLE=var.dynamodb_table_name
    }
  }
}

resource "aws_lambda_permission" "allow_cognito" {
  statement_id  = "AllowExecutionFromCognito"
  action        = "lambda:InvokeFunction"
  function_name = "confirm_signup"
  principal     = "cognito-idp.amazonaws.com"
  source_arn    = aws_cognito_user_pool.main.arn
}

resource "aws_cloudwatch_log_group" "default" {
  name = "${aws_lambda_function.lambda.function_name}-log"
}

resource "aws_lambda_permission" "logging" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.function_name
  principal     = "logs.${data.aws_region.current.name}.amazonaws.com"
  source_arn    = "${aws_cloudwatch_log_group.default.arn}:*"
}

resource "aws_iam_role" "lambda" {
  name               = "confirmsignup-lambda-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "lambda" {
  role       = aws_iam_role.lambda.name
  policy_arn = aws_iam_policy.policy.arn
}

resource "aws_iam_policy" "policy" {
  name        = "${aws_lambda_function.lambda.function_name}-role-policy"
  description = "role policy for lambda function"
  policy      = data.aws_iam_policy_document.lambda.json
}

# resource "aws_cognito_identity_provider" "example_provider" {
#   user_pool_id  = "${aws_cognito_user_pool.example.id}"
#   provider_name = "Google"
#   provider_type = "Google"

#   provider_details = {
#     authorize_scopes = "email"
#     client_id        = "your client_id"
#     client_secret    = "your client_secret"
#   }

#   attribute_mapping = {
#     email    = "email"
#     username = "sub"
#   }
# }
resource "aws_lambda_function" "lambda" {

  filename      = "${path.root}/python-code/zip/user_profile.zip"
  function_name = "user_profile"
  role          = aws_iam_role.lambda.arn
  handler       = "user_profile.handler"

  logging_config {
    log_format = "Text"
    log_group = aws_cloudwatch_log_group.default.name
  }

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = "python3.10"

  environment {
    variables = {
      DYNAMODB_TABLE=var.dynamodb_table_name
    }
  }
}


resource "aws_lambda_permission" "lambda_permission" {
  statement_id  = "AllowAPIInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.function_name
  principal     = "apigateway.amazonaws.com"

  # The /* part allows invocation from any stage, method and resource path
  # within API Gateway.
  source_arn = "${aws_api_gateway_rest_api.api.execution_arn}/*"
}

resource "aws_cloudwatch_log_group" "default" {
  name = "userprofile-lambda-log"
}

resource "aws_lambda_permission" "logging" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.function_name
  principal     = "logs.${data.aws_region.current.name}.amazonaws.com"
  source_arn    = "${aws_cloudwatch_log_group.default.arn}:*"
}

resource "aws_iam_role" "lambda" {
  name               = "${var.name}-lambda-role"
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

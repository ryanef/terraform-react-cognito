data "template_file" "init" {
  template = "${file("${path.module}/api.json")}"
  vars = {
    user_pool_arn = var.user_pool_arn
    uri = aws_lambda_function.lambda.invoke_arn
  }
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "${path.root}/python-code/user_profile.py"
  output_path = "${path.root}/python-code/zip/user_profile.zip"
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
    principals {
      type        = "Service"
      identifiers = ["cognito-idp.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "lambda" {

  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = ["arn:aws:logs:*:*:*"]
  }

  statement {
    effect = "Allow"

    actions = [
      "dynamodb:PutItem",
      "dynamodb:GetItem",
    ]

    resources = ["${var.dynamodb_table_arn}"]
  }
}

data "aws_region" "current" {}
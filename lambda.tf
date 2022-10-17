
module "lambda-function" {

  source  = "terraform-aws-modules/lambda/aws"
  version = "3.3.1"

  function_name = "${var.function_name}-${var.env}"
  description   = local.constants.lambda.DESCRIPTION
  handler       = local.constants.lambda.HANDLER
  runtime       = local.constants.lambda.VERSION

  memory_size                       = local.constants.lambda.MEMORY_SIZE
  cloudwatch_logs_retention_in_days = local.constants.lambda.CLOUDWATCH_RETENTION
  source_path                       = local.constants.lambda.SOURCE_PATH
  timeout                           = local.constants.lambda.TIMEOUT
  create_async_event_config         = true
  maximum_retry_attempts            = local.constants.lambda.RETRIES_ATTEMPT
  reserved_concurrent_executions    = local.constants.lambda.RCE
  tracing_mode                      = local.constants.lambda.TRACING_MODE

  policies           = [aws_iam_policy.lambda_policy.arn]
  attach_policies    = true
  number_of_policies = 1

  environment_variables = {
    ENV = var.env
  }

  tags = {
    Name = "${var.function_name}-${var.env}"
  }

  trusted_entities = local.constants.lambda.TRUSTED_ENTITIES
}

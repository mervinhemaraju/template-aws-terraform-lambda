
# Get the Lambda ARN as output
output "lambda_function_arn" {
  value = module.lambda-function.lambda_function_arn
}

# Get the Role Name of the Lambda function as output
output "lambda_role_name" {
  value = module.lambda-function.lambda_role_name
}

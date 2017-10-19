# Allow the SNS topic to trigger Lambda
resource "aws_lambda_permission" "allow_lambda_invocation" {
  statement_id  = "AllowExecutionFromSNS"
  action        = "lambda:InvokeFunction"
  function_name = "${var.lambda_function_name}"
  principal     = "sns.amazonaws.com"
  source_arn    = "${var.sns_arn}"
}

# Subscribe the Lambda function to the SNS topic
resource "aws_sns_topic_subscription" "sns_to_lambda_sub" {
  topic_arn = "${var.sns_arn}"
  protocol  = "lambda"
  endpoint  = "${var.lambda_arn}"
}

resource "aws_iam_role" "default" {
  name = "iam_for_lambda_with_sns"
  assume_role_policy = "${var.assume_role_policy}"
}

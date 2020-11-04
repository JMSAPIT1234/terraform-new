data "aws_iam_policy_document" "platform-gitlab-kms-policy" {
  # statement {
  #   sid = "Allow KMS Use"
  #   effect = "Allow"
  #   actions = [
  #     "kms:Encrypt",
  #     "kms:Decrypt",
  #     "kms:ReEncrypt*",
  #     "kms:GenerateDataKey*",
  #     "kms:DescribeKey",
  #   ]
  #   resources = [
  #     "<arn of the key goes here>"
  #   ]
  # }
}
resource "aws_iam_instance_profile" "node" {
  name = var.name
  role = aws_iam_role.node.name
}


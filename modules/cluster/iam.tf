resource "aws_iam_instance_profile" "node" {
  name = var.name
  role = var.iam_role_node
}


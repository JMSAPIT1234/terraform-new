terraform {
  required_version = ">= 0.12"
}

resource "local_file" "kubeconfig" {
  content  = local.kubeconfig
  filename = "~/.kube/config"

  depends_on = [null_resource.output]
}

resource "local_file" "aws_auth" {
  content  = local.aws_auth
  filename = "aws-auth.yaml"

  depends_on = [null_resource.output]
}

resource "aws_kms_key" "platform-gitlab-kms" {
  description             = "platform-gitlab-kms"
  policy                  = "${data.aws_iam_policy_document.platform-gitlab-kms-policy.json}"
}

resource "aws_eks_cluster" "cluster" {
  name     = var.name
  version  = var.eks_version
  role_arn = var.iam_role_cluster

  vpc_config {
    subnet_ids              = flatten([var.subnet_ids])
    security_group_ids      = flatten([var.security_group])
    endpoint_private_access = var.cluster_private_access
    endpoint_public_access  = var.cluster_public_access
  }

  encryption_config {
    resources = ["secrets"]
    provider {
      key_arn = aws_kms_key.platform-gitlab-kms.arn
    }
  }

  provisioner "local-exec" {
    command = <<COMMAND
      kubectl apply -f aws-auth.yaml \
      kubectl delete ds aws-node -n kube-system \
      kubectl apply -f calico.yaml
      COMMAND
      }
}
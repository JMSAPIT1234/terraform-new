resource "aws_eks_node_group" "node" {
  node_group_name = var.name

  lifecycle {
    create_before_destroy = false
    ignore_changes        = [scaling_config[0].desired_size]
  }

  # From here to end of resource should be identical in both node groups
  cluster_name    = var.cluster_name
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.subnet_ids
  disk_size       = var.disk_size
  instance_types  = var.instance_type
  ami_type        = var.ami_id

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }
    dynamic "remote_access" {
      ec2_ssh_key               = var.key_pair
      source_security_group_ids = var.security_groups
    }
  }
}


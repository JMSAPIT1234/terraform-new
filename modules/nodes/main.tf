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

locals {
  have_ssh_key = var.ec2_ssh_key != null && var.ec2_ssh_key != ""
}

locals {
  ng_needs_remote_access = local.have_ssh_key && ! local.use_launch_template
  ng = {
    # Configure remote access via Launch Template if we are using one
    need_remote_access        = local.ng_needs_remote_access
    ec2_ssh_key               = local.have_ssh_key ? var.ec2_ssh_key : "none"
    source_security_group_ids = local.ng_needs_remote_access ? var.security_groups : []
  }
}

  dynamic "remote_access" {
    for_each = local.ng.need_remote_access ? ["true"] : []
    content {
      ec2_ssh_key               = local.ng.ec2_ssh_key
      source_security_group_ids = local.ng.source_security_group_ids
    }
  }
}


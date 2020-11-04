provider "aws" {
  region = var.region
}

data "aws_iam_instance_profile" "eks-worker-profile" {
  name = "eks-nodegroup-role"
}

module "cluster" {
  source = "./modules/cluster"

  name             = var.name
  cluster_arn      = var.cluster_arn
  region           = var.region
  eks_version      = var.eks_version
  vpc_id           = var.vpc_id
  subnet_ids       = flatten([var.cluster_subnet_ids])
  aws_auth         = var.aws_auth #not_used
  iam_role_cluster = var.iam_role_cluster
  node_role_arn = var.node_role_arn
  admin_arn        = var.admin_arn
  cluster_private_access = var.cluster_private_access
  cluster_public_access = var.cluster_public_access
}

resource "aws_security_group" "workstation-ssh-platform" {
  name        = "workstation-ssh-platform"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = flatten([var.workstation_cidr])
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

module "eks_workers" {
  source                             = "git::https://github.com/cloudposse/terraform-aws-eks-workers.git?ref=0.15.2"
  # namespace                          = "corp"
  # stage                              = "DEV"
  name                               = var.name
  workers_role_policy_arns           = [var.node_role_arn]
  use_existing_aws_iam_instance_profile = "true"
  aws_iam_instance_profile_name      = data.aws_iam_instance_profile.eks-worker-profile.name
  instance_type                      = var.node_instance_type
  use_custom_image_id                = "true"
  image_id                           = var.node_ami_id
  key_name                           = var.key_pair
  allowed_security_groups            = [aws_security_group.workstation-ssh-platform.id]
  vpc_id                             = var.vpc_id
  subnet_ids                         = flatten([var.cluster_subnet_ids])
  health_check_type                  = "EC2"  
  enable_monitoring                  = "false"
  min_size                           = var.node_min_size
  max_size                           = var.node_max_size
  cluster_name                       = module.cluster.name
  cluster_endpoint                   = module.cluster.endpoint
  cluster_certificate_authority_data = module.cluster.certificate
  cluster_security_group_id          = module.cluster.security_group
  additional_security_group_ids      = flatten([var.security_group])
  autoscaling_group_tags = {
    "k8s.io/cluster-autoscaler/enabled" = "true"
    "k8s.io/cluster-autoscaler/${module.cluster.name}"    = "owned"
  }

  # Auto-scaling policies and CloudWatch metric alarms
  autoscaling_policies_enabled           = "true"
  cpu_utilization_high_threshold_percent = 75
  cpu_utilization_low_threshold_percent  = 30
}  


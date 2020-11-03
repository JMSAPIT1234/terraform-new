provider "aws" {
  region = var.region
}

module "cluster" {
  source = "./modules/cluster"

  name             = var.name
  region           = var.region
  eks_version      = var.eks_version
  vpc_id           = var.vpc_id
  subnet_ids       = flatten([var.cluster_subnet_ids])
  workstation_cidr = [var.workstation_cidr]
  ssh_cidr         = var.ssh_cidr
  aws_auth         = var.aws_auth #not_used
  iam_role_cluster = var.iam_role_cluster
  iam_role_node = var.iam_role_node
  cluster_private_access = var.cluster_private_access
  cluster_public_access = var.cluster_public_access

}

module "nodes" {
  source = "./modules/nodes"

  name                = var.name
  cluster_name        = module.cluster.name
  cluster_endpoint    = module.cluster.endpoint
  cluster_certificate = module.cluster.certificate
  security_groups     = [module.cluster.node_security_group]
  instance_profile    = module.cluster.node_instance_profile #balikan mo
  subnet_ids          = flatten([var.cluster_subnet_ids])
  ami_id              = var.node_ami_id
  instance_type       = var.node_instance_type
  user_data           = var.node_user_data
  bootstrap_arguments = var.node_bootstrap_arguments
  min_size            = var.node_min_size
  max_size            = var.node_max_size
  key_pair            = var.key_pair
  disk_size           = var.node_disk_size
}


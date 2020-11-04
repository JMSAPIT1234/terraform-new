variable "name" { #used
  default        = "devops_eks_terra"
  description = "Name to be used on all the resources as identifier."
}

variable "eks_version" { #used
  default     = "1.18"
  description = "Kubernetes version to use for the cluster."
}

variable "region" { #used
  default     = "me-south-1"
  description = "Region"
}

variable "iam_role_cluster" { #used
  default     = "arn:aws:iam::414582846745:role/eks-admin-role"
  description = "iam role of cluster"
}

variable "node_role_arn" { #used
  default     = "arn:aws:iam::414582846745:role/devops-eks-node"
  description = "iam role of node"
}

variable "cluster_arn" { #used
  default     = "arn:aws:iam::414582846745:cluster"
  description = "cluster arn"
}

variable "admin_arn" { #used
  default     = "arn:aws:iam::414582846745:role/devops-eks-admin"
  description = "cluster arn"
}

variable "security_group" {
  default     = ["sg-01afdf11c8d8b02ae","sg-0034b6097b20f2934"]
  description = "A list of security groups which the cluster uses."
}

variable "vpc_id" { #used
  default     = "vpc-05158173739022765"
  description = "ID of the VPC where to create the cluster resources."
}

variable "cluster_private_access" { #used
  default     = true
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled."
}

variable "cluster_public_access" { #used
  default     = false
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled."
}

variable "cluster_subnet_ids" { #used
  default = ["subnet-0d1b60c7d94619770","subnet-0369e6e1dde1c241e"]
  description = "A list of VPC subnet IDs which the cluster uses."
}

variable "node_ami_id" { #used
  default     = "ami-08310b5f38c1de6c2"
  description = "AMI id for the node instances."
}

variable "node_instance_type" { #used
  default     = "t2.large"
  description = "Instance type of the worker node."
}

variable "node_min_size" { #used
  default     = 1
  description = "Minimum size of the worker node AutoScaling Group."
}

variable "aws_auth" { #used
  default     = ""
  description = "aws_ auth"
}

variable "node_max_size" { #used
  default     = 2
  description = "Maximum size of the worker node AutoScaling Group."
}

variable "node_disk_size" { #used
  default     = 20
  description = "The root device size for the worker nodes."
}

variable "node_desired_size" { #used
  default     = 1
  description = "The root device size for the worker nodes."
}

variable "workstation_cidr" { #used
  default     = []
  description = "CIDR blocks from which to allow inbound traffic to the Kubernetes control plane."
}

variable "key_pair" { #used
  default     = "devops-eks-key"
  description = "Adds an EC2 Key Pair to the cluster nodes."
}
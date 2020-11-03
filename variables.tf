variable "name" { #used
  default        = "devops_eks"
  description = "Name to be used on all the resources as identifier."
}

variable "eks_version" { #used
  default     = "1.18"
  description = "Kubernetes version to use for the cluster."
}

variable "region" { #used
  default     = "ap-southeast-1"
  description = "Region"
}

variable "iam_role_cluster" { #used
  default     = "arn:aws:iam::617638789148:role/eksclusterrole"
  description = "iam role of cluster"
}

variable "iam_role_node" { #used
  default     = "eks-node"
  description = "iam role of node"
}

variable "vpc_id" { #used
  default     = "vpc-0cf43de42bea39c3d"
  description = "ID of the VPC where to create the cluster resources."
}

variable "cluster_private_access" { #used
  default     = true
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled."
}

variable "cluster_public_access" { #used
  default     = true
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled."
}

variable "cluster_subnet_ids" { #used
  default = ["subnet-0a24c56810137e662","subnet-0818f2fc521deeaa1"]
  description = "A list of VPC subnet IDs which the cluster uses."
}

variable "node_ami_id" { #used
  default     = "ami-0c8e97a27be37adfd"
  description = "AMI id for the node instances."
}

# variable "node_subnet_ids" { #used
#   default     = []
#   description = "A list of VPC subnet IDs which the worker nodes are using."
# }

variable "node_instance_type" { #used
  default     = "t2.medium"
  description = "Instance type of the worker node."
}

variable "node_min_size" { #used
  default     = 1
  description = "Minimum size of the worker node AutoScaling Group."
}

variable "node_max_size" { #used
  default     = 2
  description = "Maximum size of the worker node AutoScaling Group."
}

variable "node_user_data" { #used
  default     = ""
  description = "Additional user data used when bootstrapping the EC2 instance."
}

variable "node_bootstrap_arguments" { #used
  default     = ""
  description = "Additional arguments when bootstrapping the EKS node."
}

variable "node_disk_size" { #used
  default     = 20
  description = "The root device size for the worker nodes."
}

variable "workstation_cidr" { #used
  default     = []
  description = "CIDR blocks from which to allow inbound traffic to the Kubernetes control plane."
}

variable "key_pair" { #used
  default     = "jmsandbox"
  description = "Adds an EC2 Key Pair to the cluster nodes."
}

variable "ssh_cidr" { #used
  default     = ""
  description = "The CIDR blocks from which to allow incoming ssh connections to the EKS nodes."
}

variable "aws_auth" {
  default     = ""
  description = "Grant additional AWS users or roles the ability to interact with the EKS cluster."
}

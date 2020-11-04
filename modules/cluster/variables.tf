variable "name" {
  type        = string
  description = "Name to be used on all the EKS Cluster resources as identifier."
}

variable "eks_version" {
  description = "Kubernetes version to use for the cluster."
}

variable "region" { #used
  default     = ""
  description = "Region"
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC where to create the cluster resources."
}

variable "cluster_arn" { #used
  default     = ""
  description = "iam role of node"
}

variable "subnet_ids" {
  default     = []
  description = "A list of VPC subnet IDs which the cluster uses."
}

variable "security_group" {
  default     = []
  description = "A list of security groups which the cluster uses."
}

variable "iam_role_cluster" { #used
  default     = ""
  description = "iam role of cluster"
}

variable "workstation_cidr" {
  default     = []
  description = "CIDR blocks from which to allow inbound traffic to the Kubernetes control plane."
}

variable "node_role_arn" { #used
  default     = ""
  description = "iam role of node"
}

variable "cluster_private_access" {
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled."
}

variable "cluster_public_access" {
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled."
}

variable "desired_size" {
  default     = ""
  description = "The root device size for the worker nodes."
}

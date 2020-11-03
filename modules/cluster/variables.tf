variable "name" {
  type        = string
  description = "Name to be used on all the EKS Cluster resources as identifier."
}

variable "eks_version" {
  description = "Kubernetes version to use for the cluster."
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC where to create the cluster resources."
}

variable "subnet_ids" {
  default     = []
  description = "A list of VPC subnet IDs which the cluster uses."
}

variable "workstation_cidr" {
  default     = []
  description = "CIDR blocks from which to allow inbound traffic to the Kubernetes control plane."
}

variable "ssh_cidr" {
  default     = ""
  description = "The CIDR blocks from which to allow incoming ssh connections to the EKS nodes."
}

variable "aws_auth" {
  default     = ""
  description = "Grant additional AWS users or roles the ability to interact with the EKS cluster."
}

variable "permissions_boundary" {
  default     = ""
  description = "If provided, all IAM roles will be created with this permissions boundary attached."
}

variable "cluster_private_access" {
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled."
}

variable "cluster_public_access" {
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled."
}


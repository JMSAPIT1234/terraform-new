output "name" {
  value       = aws_eks_cluster.cluster.name
  description = "Cluster name provided when the cluster was created."
}

output "endpoint" {
  value       = aws_eks_cluster.cluster.endpoint
  description = "Endpoint of the Kubernetes Control Plane."
}

output "certificate" {
  value       = aws_eks_cluster.cluster.certificate_authority[0].data
  description = "Certificate used to authenticate to the Kubernetes Controle Plane."
}

output "security_group" {
  value       = aws_eks_cluster.cluster.vpc_config[0].cluster_security_group_id
  description = "Certificate used to authenticate to the Kubernetes Controle Plane."
}

# output "node_role" {
#   value       = aws_iam_role.node.name
#   description = "IAM Role which has the required policies to add the node to the cluster."
# }

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

# output "node_role" {
#   value       = aws_iam_role.node.name
#   description = "IAM Role which has the required policies to add the node to the cluster."
# }

output "cluster_security_group" {
  value       = aws_security_group.cluster.id
  description = "Security Group between cluster and nodes."
}

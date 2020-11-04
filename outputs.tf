output "cluster_name" {
  value       = module.cluster.name
  description = "Cluster name provided when the cluster was created."
}

output "cluster_endpoint" {
  value       = module.cluster.endpoint
  description = "Endpoint of the Kubernetes Control Plane."
}

output "cluster_certificate" {
  value       = module.cluster.certificate
  description = "Certificate used to authenticate to the Kubernetes Controle Plane."
}

output "cluster_security_group" {
  value       = module.cluster.cluster_security_group
  description = "Security Group between cluster and nodes."
}

output "node_security_group" {
  value       = module.cluster.node_security_group
  description = "Security Group to be able to access to the Kubernetes Control Plane and other nodes."
}
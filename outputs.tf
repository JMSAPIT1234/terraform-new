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
  value       = module.cluster.vpc_config[0].cluster_security_group_id
  description = "Certificate used to authenticate to the Kubernetes Controle Plane."
}
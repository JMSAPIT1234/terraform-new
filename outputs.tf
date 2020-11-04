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
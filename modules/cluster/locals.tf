locals {
  kubeconfig = <<KUBECONFIG
apiVersion: v1
clusters:
- cluster:
    server: ${aws_eks_cluster.cluster.endpoint}
    certificate-authority-data: ${aws_eks_cluster.cluster.certificate_authority[0].data}
  name: ${var.cluster_arn}
contexts:
- context:
    cluster: ${var.cluster_arn}
    user: ${var.cluster_arn}
  name: ${var.cluster_arn}
current-context: ${var.cluster_arn}
kind: Config
preferences: {}
users:
- name: ${var.cluster_arn}
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1alpha1
      args:
      - --region
      - ${var.region}
      - eks
      - get-token
      - --cluster-name
      - ${aws_eks_cluster.cluster.name}
      command: aws
KUBECONFIG


  aws_auth = <<AWSAUTH
apiVersion: v1
kind: ConfigMap
metadata:
  name: aws-auth
  namespace: kube-system
data:
  mapRoles: |
    - rolearn: ${aws_iam_role.node.arn}
      username: system:node:{{EC2PrivateDNSName}}
      groups:
        - system:bootstrappers
        - system:nodes
  mapUsers: |
    - userarn: ${admin_arn}
      username: admin
      groups:
        - system:masters
AWSAUTH
}

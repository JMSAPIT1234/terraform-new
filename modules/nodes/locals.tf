locals {

  user_data = <<USERDATA
#!/bin/bash
set -o xtrace
/etc/eks/bootstrap.sh --apiserver-endpoint '${var.cluster_endpoint}' --b64-cluster-ca '${var.cluster_certificate}' ${var.bootstrap_arguments} '${var.cluster_name}'
${var.user_data}
USERDATA

}


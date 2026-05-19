resource "helm_release" "secrets_store_csi_driver" {
  depends_on =[
  aws_eks_addon.podidentity,
  aws_eks_node_group.private_nodes
  ]

    name = "csi-secrets-store"
    repository = "https://kubernetes-sigs.github.io/secrets-store-csi-driver/charts"
    chart = "secrets-store-csi-driver"
    namespace = "kube-system"
     set = [{
       name ="syncSecret.enabled"
       value = "true"
     }]
     wait = true
     timeout = 600
     cleanup_on_fail = true
     
    
}


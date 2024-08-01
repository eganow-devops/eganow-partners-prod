output "eganow_cluster_id" {
  value = digitalocean_kubernetes_cluster.eganow_cluster.id
}

output "eganow_cluster_kubeconfig_host" {
  value = digitalocean_kubernetes_cluster.eganow_cluster.kube_config.0.host
}

output "eganow_cluster_kubeconfig_ca_cert" {
  value = base64decode(digitalocean_kubernetes_cluster.eganow_cluster.kube_config.0.cluster_ca_certificate)
}

output "eganow_cluster_kubeconfig_token" {
  value = digitalocean_kubernetes_cluster.eganow_cluster.kube_config.0.token
}
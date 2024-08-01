# payment gateway k8s cluster
resource "digitalocean_kubernetes_cluster" "eganow_cluster" {
  name         = var.cluster_eganow_name
  region       = var.cluster_region
  version      = data.digitalocean_kubernetes_versions.k8s_version.latest_version
  auto_upgrade = true
  vpc_uuid     = digitalocean_vpc.eganow_vpc.id

  node_pool {
    name       = "${var.cluster_eganow_name}-pool"
    size       = var.cluster_eganow_node_pool_size
    auto_scale = true
    min_nodes  = var.cluster_node_autoscale_min_count
    max_nodes  = var.cluster_node_autoscale_max_count
  }

  maintenance_policy {
    start_time = var.cluster_maintenance_start_time
    day        = var.cluster_maintenance_day
  }

  depends_on = [digitalocean_vpc.eganow_vpc]
}
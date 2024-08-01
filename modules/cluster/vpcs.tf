resource "digitalocean_vpc" "eganow_vpc" {
  name     = "${var.cluster_eganow_name}-vpc"
  region   = var.cluster_region
  ip_range = var.cluster_eganow_vpc_ip_range
}
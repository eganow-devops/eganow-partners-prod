resource "digitalocean_firewall" "eganow_core_firewall" {
  name        = "${var.cluster_eganow_name}-firewall"
  droplet_ids = [
    for droplet in digitalocean_kubernetes_cluster.eganow_cluster.node_pool.0.nodes : droplet.droplet_id
  ]

  inbound_rule {
    protocol         = "tcp"
    port_range       = 22
    source_addresses = var.eganow_inbound_source_address
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = 443
    source_addresses = var.eganow_inbound_source_address
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = 443
    destination_addresses = var.eganow_outbound_source_address
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = 25
    destination_addresses = var.eganow_outbound_source_address
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = 587
    destination_addresses = var.eganow_outbound_source_address
  }
}
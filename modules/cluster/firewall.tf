resource "digitalocean_firewall" "eganow_partners_firewall" {
  name        = "${var.cluster_eganow_name}-firewall"
  droplet_ids = [
    for droplet in digitalocean_kubernetes_cluster.eganow_cluster.node_pool.0.nodes : droplet.droplet_id
  ]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = var.eganow_inbound_source_addresses
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = var.eganow_inbound_source_addresses
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = var.eganow_inbound_source_addresses
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "443"
    destination_addresses = var.eganow_outbound_destination_addresses
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "25"
    destination_addresses = var.eganow_outbound_destination_addresses
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "587"
    destination_addresses = var.eganow_outbound_destination_addresses
  }
}
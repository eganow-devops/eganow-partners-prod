resource "kubernetes_secret_v1" "digitalocean_dns_token" {
  metadata {
    name      = var.do_dns_token_name
    namespace = var.pay_partners_namespace
  }

  data = {
    token = var.do_token
  }
}
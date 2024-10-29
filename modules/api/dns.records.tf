resource "digitalocean_domain" "payment" {
  name = var.domain_name
}

resource "digitalocean_record" "onepassword_vault" {
  domain = digitalocean_domain.payment.id
  name   = "vault"
  type   = "A"
  value  = data.kubernetes_service_v1.ingress_lb.status.0.load_balancer.0.ingress.0.ip
}

# resource "digitalocean_record" "mtngh_mad_api_name_enquiry" {
#   domain = digitalocean_domain.payment.id
#   name   = "mtngh-mad-api-name-enquiry"
#   type   = "A"
#   value  = data.kubernetes_service_v1.ingress_lb.status.0.load_balancer.0.ingress.0.ip
# }

resource "digitalocean_record" "mtngh_mad_api_egapay" {
  domain = digitalocean_domain.payment.id
  name   = "mtngh-egapay"
  type   = "A"
  value  = data.kubernetes_service_v1.ingress_lb.status.0.load_balancer.0.ingress.0.ip
}

resource "digitalocean_record" "mtngh_mad_api_pospay" {
  domain = digitalocean_domain.payment.id
  name   = "mtngh-pospay"
  type   = "A"
  value  = data.kubernetes_service_v1.ingress_lb.status.0.load_balancer.0.ingress.0.ip
}

resource "digitalocean_record" "ndc_volta_ussd" {
  domain = digitalocean_domain.payment.id
  name   = "ndcvolta-ussd"
  type   = "A"
  value  = data.kubernetes_service_v1.ingress_lb.status.0.load_balancer.0.ingress.0.ip
}

resource "digitalocean_record" "ndc_volta_api" {
  domain = digitalocean_domain.payment.id
  name   = "ndcvolta"
  type   = "A"
  value  = data.kubernetes_service_v1.ingress_lb.status.0.load_balancer.0.ingress.0.ip
}

resource "digitalocean_record" "ndc_volta_callback" {
  domain = digitalocean_domain.payment.id
  name   = "ndcvolta-callback"
  type   = "A"
  value  = data.kubernetes_service_v1.ingress_lb.status.0.load_balancer.0.ingress.0.ip
}

resource "digitalocean_record" "ghipss_api" {
  domain = digitalocean_domain.payment.id
  name   = "ghipss"
  type   = "A"
  value  = var.ghipss_iis_ip_address
}

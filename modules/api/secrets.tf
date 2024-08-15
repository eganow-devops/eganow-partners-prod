resource "kubernetes_secret_v1" "digitalocean_dns_token" {
  metadata {
    name      = "digitalocean-dns"
    namespace = module.cert-manager.namespace
  }

  data = {
    token = var.do_token
  }
}

# secret for 1password key vault
# resource "kubernetes_secret_v1" "eganow_key_vault" {
#   metadata {
#     name      = var.eganow_key_vault_name
#     namespace = var.pay_partners_namespace
#   }
#
#   data = {
#     "jwt-secret" : "", # @todo - add jwt secret
#     "vault-uuid" : "", # @todo - add vault uuid
#     "pay-partner-db-vault-uuid" : "" # @todo - add pay partner db vault uuid
#   }
# }

# secret for 1password key vault
resource "kubernetes_secret_v1" "onepassword_connect" {
  metadata {
    name      = "onepassword-connect"
    namespace = var.pay_partners_namespace
  }

  data = {
    "onepassword-credentials" : base64encode(jsonencode(var.onepassword_credentials_json))
    token = var.onepassword_token
  }
}

#  secret for dockerconfigjson
resource "kubernetes_secret_v1" "dockerconfigjson" {
  metadata {
    name      = "dockerconfigjson"
    namespace = var.pay_partners_namespace
  }

  type = "kubernetes.io/dockerconfigjson"
  data = {
    ".dockerconfigjson" = jsonencode(var.dockerconfigjson)
  }
}
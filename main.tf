terraform {
  cloud {
    organization = "eganow-devops-org"
    workspaces {
      name = "eganow-partners-prod-ws"
    }
  }
}

module "cluster" {
  source                                = "./modules/cluster"
  do_token                              = var.do_token
  eganow_inbound_source_addresses       = var.eganow_inbound_source_addresses
  eganow_outbound_destination_addresses = var.eganow_outbound_destination_addresses
}

module "api" {
  source                            = "./modules/api"
  k8s_cluster_ca_cert               = module.cluster.eganow_cluster_kubeconfig_ca_cert
  k8s_cluster_token                 = module.cluster.eganow_cluster_kubeconfig_token
  k8s_cluster_host                  = module.cluster.eganow_cluster_kubeconfig_host
  domain_name                       = var.domain_name
  onepassword_credentials_json      = var.onepassword_credentials_json
  dockerconfigjson                  = var.dockerconfigjson
  newrelic_license_key              = var.newrelic_license_key
  onepassword_token                 = var.onepassword_token
  lb_inbound_source_addresses       = var.lb_inbound_source_addresses
  lb_outbound_destination_addresses = var.lb_outbound_destination_addresses

  do_token             = var.do_token
  cluster_issuer_email = var.cluster_issuer_email
}
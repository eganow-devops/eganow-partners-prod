#################################################
# CLUSTER
#################################################
variable "k8s_cluster_host" {
  description = "The host of the Kubernetes cluster"
  type        = string
}

variable "k8s_cluster_ca_cert" {
  description = "The CA certificate of the Kubernetes cluster"
  type        = string
}

variable "k8s_cluster_token" {
  description = "The token of the Kubernetes cluster"
  type        = string
}

variable "cluster_issuer_email" {
  description = "The email of the cluster issuer"
  type        = string
}

variable "cluster_issuer_name" {
  description = "The name of the cluster issuer"
  type        = string
  default     = "eganow-cert-manager"
}

variable "cluster_issuer_private_key_secret_name" {
  description = "The name of the secret that contains the private key of the cluster issuer"
  type        = string
  default     = "cert-manager-private-key"
}

#################################################
# CLOUD PROVIDER (DIGITALOCEAN)
#################################################
variable "do_token" {
  type        = string
  description = "DigitalOcean API token"
  sensitive   = true
}

#################################################
# DOMAIN
#################################################
variable "domain_name" {
  description = "The domain name to use for the ingress"
  type        = string
}

#################################################
# MONITORING & LOGGING (NEWRELIC)
#################################################
variable "newrelic_license_key" {
  type      = string
  sensitive = true
}

variable "newrelic_cluster_name" {
  type        = string
  description = "The name of the cluster to monitor"
  default     = "eganow-core"
}

variable "newrelic_namespace" {
  type        = string
  description = "The namespace to install New Relic"
  default     = "ns-newrelic"
}

variable "newrelic_kube_state_metrics_version" {
  type        = string
  description = "The version of kube-state-metrics to install"
  default     = "v2.10.0"
}


# ################################################
# PROJECT RESOURCES (SECRETS, NAMESPACES ETC)
#################################################
variable "pay_partners_namespace" {
  description = "The namespace of the project"
  type        = string
  default     = "ns-eganow-pay-partners"
}

variable "ingress_namespace" {
  description = "The namespace of the ingress"
  type        = string
  default     = "ns-partners-ingress"
}

variable "dockerconfigjson" {
  description = "Docker config JSON needed to set up image pull credentials"
  type = object({
    auths = map(object({
      username = string
      password = string
      email    = string
      auth     = string
    }))
  })
  sensitive = true
}

variable "http_ingress_tls_secret_name" {
  description = "The name of the secret that contains the TLS certificate"
  type        = string
  default     = "http-ingress-tls"
}

variable "grpc_ingress_tls_secret_name" {
  description = "The name of the secret that contains the TLS certificate"
  type        = string
  default     = "grpc-ingress-tls"
}

variable "insecure_port" {
  description = "The port to use for the insecure service"
  type        = number
  default     = 8080
}

variable "secured_port" {
  description = "The port to use for the secured service"
  type        = number
  default     = 443
}

variable "secured_port_name" {
  description = "The name of the secured port"
  type        = string
  default     = "https"
}

variable "onepassword_credentials_json" {
  description = "The name of the secret that contains the 1password credentials"
  type = object({
    verifier = object({
      salt      = string
      localHash = string
    })
    encCredentials = object({
      kid  = string
      enc  = string
      cty  = string
      iv   = string
      data = string
    })
    version    = string
    deviceUuid = string
    uniqueKey = object({
      alg = string
      ext = bool
      k   = string
      key_ops = list(string)
      kty = string
      kid = string
    })
  })
}
variable "onepassword_token" {
  description = "The token of the 1password secret"
  type        = string
  sensitive   = true
}

variable "min_pod_replicas" {
  description = "The minimum number of replicas for the deployment"
  type        = number
  default     = 1
}

variable "max_pod_replicas" {
  description = "The maximum number of replicas for the deployment"
  type        = number
  default     = 3
}

variable "lb_inbound_source_addresses" {
  type = set(string)
  description = "The source addresses for the inbound rules for load balancer"
}

variable "lb_outbound_destination_addresses" {
  type = set(string)
  description = "The source addresses for the outbound rules for load balancer"
}

variable "redis_password" {
  description = "Redis password"
  type        = string
  default     = "Password for Redis cluster"
  sensitive   = true
}

variable "ghipss_iis_ip_address" {
  type        = string
  description = "The IP address of the GHIPSS IIS instance"
  sensitive   = true
}
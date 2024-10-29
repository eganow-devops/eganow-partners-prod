variable "do_token" {
  type        = string
  description = "DigitalOcean API token"
  sensitive   = true
}

variable "cluster_issuer_email" {
  description = "The email of the cluster issuer"
  type        = string
}

variable "domain_name" {
  description = "The domain name to use for the ingress"
  type        = string
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
  default = {
    auths = {
      "dummy" = {
        username = ""
        password = ""
        email    = ""
        auth     = ""
      }
    }
  }
}

variable "eganow_inbound_source_addresses" {
  type = list(string)
}

variable "eganow_outbound_destination_addresses" {
  type = list(string)
}

variable "lb_inbound_source_addresses" {
  type = set(string)
  description = "The source addresses for the inbound rules for load balancer"
}

variable "lb_outbound_destination_addresses" {
  type = set(string)
  description = "The source addresses for the outbound rules for load balancer"
}

variable "newrelic_license_key" {
  type      = string
  sensitive = true
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
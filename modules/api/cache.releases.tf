########################
# MTN REDIS            #
########################
resource "helm_release" "mtn_redis" {
  chart      = "redis-ha"
  name       = "mtn"
  repository = "https://dandydeveloper.github.io/charts/"
  version    = var.redis_ha_version
  namespace  = var.pay_partners_namespace

  cleanup_on_fail = true
}

########################
# GHIPSS REDIS         #
########################
resource "helm_release" "ghipss_redis" {
  chart      = "redis-ha"
  name       = "ghipss"
  repository = "https://dandydeveloper.github.io/charts/"
  version    = var.redis_ha_version
  namespace  = var.pay_partners_namespace

  cleanup_on_fail = true

  set {
    name  = "haproxy.enabled"
    value = "true"
  }
  set {
    name  = "haproxy.service.type"
    value = "LoadBalancer"
  }
}

########################
# ATMONEY REDIS        #
########################

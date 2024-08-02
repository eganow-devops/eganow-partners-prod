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

########################
# ATMONEY REDIS        #
########################

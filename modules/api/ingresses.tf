resource "helm_release" "nginx_ing" {
  chart      = "ingress-nginx"
  name       = "partners-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  version    = var.nginx_ingress_version
  namespace  = "ns-partners-ingress"

  create_namespace = true
  cleanup_on_fail  = true
  set {
    name  = "service.type"
    value = "LoadBalancer"
  }
}
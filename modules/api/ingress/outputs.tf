output "ingress_loadbalancer_ip" {
  value = kubernetes_ingress_v1.eganow_partners_ing.status.0.load_balancer.0.ingress.0.ip
}
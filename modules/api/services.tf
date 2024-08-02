resource "kubernetes_service_v1" "onepassword" {
  metadata {
    name      = "onepassword-connect"
    namespace = var.pay_partners_namespace
  }

  spec {
    selector = {
      app = kubernetes_deployment_v1.onepassword.spec.0.selector.0.match_labels.app
    }
    port {
      name        = "http"
      port        = kubernetes_deployment_v1.onepassword.spec.0.template.0.spec.0.container.0.port.0.container_port
      target_port = kubernetes_deployment_v1.onepassword.spec.0.template.0.spec.0.container.0.port.0.container_port
    }
  }
}
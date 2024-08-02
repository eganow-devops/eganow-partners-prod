resource "kubernetes_ingress_v1" "eganow_partners_ing" {
  metadata {
    name      = "${var.project_namespace}-ingress"
    namespace = var.project_namespace
    annotations = {
      "nginx.ingress.kubernetes.io/ssl-redirect" : "true"
      "nginx.ingress.kubernetes.io/force-ssl-redirect" : "true"
      "nginx.ingress.kubernetes.io/backend-protocol" : "GRPC"
      "cert-manager.io/cluster-issuer" : var.cluster_issuer
      "kubernetes.io/ingress.class" : nginx
    }
  }

  spec {
    tls {
      hosts = ["*.${var.domain_name}"]
      secret_name = "${var.domain_name}-tls"
    }

    rule {
      host = "mtngh-egapay.${var.domain_name}"
      http {
        path {
          path = "/"
          backend {
            service {
              name = var.svc_egapay_mtn_gh
              port {
                name = var.default_grpc_service_port_name
              }
            }
          }
        }
      }
    }
  }
}
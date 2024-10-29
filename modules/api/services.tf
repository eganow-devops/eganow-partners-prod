data "kubernetes_service_v1" "ingress_lb" {
  metadata {
    name      = "${helm_release.nginx_ing.name}-${helm_release.nginx_ing.chart}-controller"
    namespace = var.ingress_namespace
  }
}

data "kubernetes_service_v1" "onepassword" {
  metadata {
    name      = helm_release.onepassword.name
    namespace = var.pay_partners_namespace
  }
}

########################################
# SERVICE: MTNGH MAD API NAME ENQUIRY
########################################
# resource "kubernetes_service_v1" "mtn_gh_mad_api_name_enquiry" {
#   metadata {
#     name      = "${kubernetes_deployment_v1.mtn_gh_mad_api_name_enquiry.metadata.0.name}-svc"
#     namespace = var.pay_partners_namespace
#   }
#
#   spec {
#     selector = {
#       app = kubernetes_deployment_v1.mtn_gh_mad_api_name_enquiry.spec.0.selector.0.match_labels.app
#     }
#
#     port {
#       name        = "http"
#       port        = kubernetes_deployment_v1.mtn_gh_mad_api_name_enquiry.spec.0.template.0.spec.0.container.0.port.0.container_port
#       target_port = kubernetes_deployment_v1.mtn_gh_mad_api_name_enquiry.spec.0.template.0.spec.0.container.0.port.0.container_port
#     }
#
#     port {
#       name        = "grpc"
#       port        = kubernetes_deployment_v1.mtn_gh_mad_api_name_enquiry.spec.0.template.0.spec.0.container.0.port.1.container_port
#       target_port = kubernetes_deployment_v1.mtn_gh_mad_api_name_enquiry.spec.0.template.0.spec.0.container.0.port.1.container_port
#     }
#   }
# }
resource "kubernetes_service_v1" "mtn_gh_mad_api_egapay" {
  metadata {
    name      = "${kubernetes_deployment_v1.mtn_gh_mad_api_egapay.metadata.0.name}-svc"
    namespace = var.pay_partners_namespace
  }

  spec {
    selector = {
      app = kubernetes_deployment_v1.mtn_gh_mad_api_egapay.spec.0.selector.0.match_labels.app
    }

    port {
      name        = "http"
      port        = kubernetes_deployment_v1.mtn_gh_mad_api_egapay.spec.0.template.0.spec.0.container.0.port.0.container_port
      target_port = kubernetes_deployment_v1.mtn_gh_mad_api_egapay.spec.0.template.0.spec.0.container.0.port.0.container_port
    }

    port {
      name        = "grpc"
      port        = kubernetes_deployment_v1.mtn_gh_mad_api_egapay.spec.0.template.0.spec.0.container.0.port.1.container_port
      target_port = kubernetes_deployment_v1.mtn_gh_mad_api_egapay.spec.0.template.0.spec.0.container.0.port.1.container_port
    }
  }
}

resource "kubernetes_service_v1" "mtn_gh_mad_api_pospay" {
  metadata {
    name      = "${kubernetes_deployment_v1.mtn_gh_mad_api_pospay.metadata.0.name}-svc"
    namespace = var.pay_partners_namespace
  }

  spec {
    selector = {
      app = kubernetes_deployment_v1.mtn_gh_mad_api_pospay.spec.0.selector.0.match_labels.app
    }

    port {
      name        = "http"
      port        = kubernetes_deployment_v1.mtn_gh_mad_api_pospay.spec.0.template.0.spec.0.container.0.port.0.container_port
      target_port = kubernetes_deployment_v1.mtn_gh_mad_api_pospay.spec.0.template.0.spec.0.container.0.port.0.container_port
    }

    port {
      name        = "grpc"
      port        = kubernetes_deployment_v1.mtn_gh_mad_api_pospay.spec.0.template.0.spec.0.container.0.port.1.container_port
      target_port = kubernetes_deployment_v1.mtn_gh_mad_api_pospay.spec.0.template.0.spec.0.container.0.port.1.container_port
    }
  }
}

resource "kubernetes_service_v1" "ndc_volta_api" {
  metadata {
    name      = "${kubernetes_deployment_v1.ndc_volta_api.metadata.0.name}-svc"
    namespace = var.pay_partners_namespace
  }

  spec {
    selector = {
      app = kubernetes_deployment_v1.ndc_volta_api.spec.0.selector.0.match_labels.app
    }

    port {
      name        = "grpc"
      port        = kubernetes_deployment_v1.ndc_volta_api.spec.0.template.0.spec.0.container.0.port.0.container_port
      target_port = kubernetes_deployment_v1.ndc_volta_api.spec.0.template.0.spec.0.container.0.port.0.container_port
    }
  }
}

resource "kubernetes_service_v1" "ndc_volta_ussd" {
  metadata {
    name      = "${kubernetes_deployment_v1.ndc_volta_ussd.metadata.0.name}-svc"
    namespace = var.pay_partners_namespace
  }

  spec {
    selector = {
      app = kubernetes_deployment_v1.ndc_volta_ussd.spec.0.selector.0.match_labels.app
    }

    port {
      name        = "http"
      port        = kubernetes_deployment_v1.ndc_volta_ussd.spec.0.template.0.spec.0.container.0.port.0.container_port
      target_port = kubernetes_deployment_v1.ndc_volta_ussd.spec.0.template.0.spec.0.container.0.port.0.container_port
    }
  }
}

resource "kubernetes_service_v1" "ndc_volta_callback" {
  metadata {
    name      = "${kubernetes_deployment_v1.ndc_volta_callback.metadata.0.name}-svc"
    namespace = var.pay_partners_namespace
  }

  spec {
    selector = {
      app = kubernetes_deployment_v1.ndc_volta_callback.spec.0.selector.0.match_labels.app
    }

    port {
      name        = "http"
      port        = kubernetes_deployment_v1.ndc_volta_callback.spec.0.template.0.spec.0.container.0.port.0.container_port
      target_port = kubernetes_deployment_v1.ndc_volta_callback.spec.0.template.0.spec.0.container.0.port.0.container_port
    }
  }
}
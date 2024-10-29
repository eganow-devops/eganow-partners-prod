/*resource "kubernetes_deployment_v1" "mtn_gh_mad_api_name_enquiry" {
  metadata {
    name      = "mtngh-mad-api-name-enquiry"
    namespace = var.pay_partners_namespace
  }

  spec {
    replicas = var.min_pod_replicas

    selector {
      match_labels = {
        app = "mtngh-mad-api-name-enquiry"
      }
    }

    template {
      metadata {
        labels = {
          app = "mtngh-mad-api-name-enquiry"
        }
      }

      spec {
        image_pull_secrets {
          name = kubernetes_secret_v1.dockerconfigjson.metadata.0.name
        }
        container {
          image             = "eganowdevops/mtngh-madapi-name-enquiry-partner-api:latest"
          name              = "mtngh-mad-api-name-enquiry"
          image_pull_policy = "Always"

          port {
            container_port = 80
            name           = "http"
          }

          port {
            container_port = 443
            name           = "grpc"
          }
        }
      }
    }

    strategy {
      type = "RollingUpdate"
      rolling_update {
        max_surge       = "25%"
        max_unavailable = "25%"
      }
    }
  }
}*/

resource "kubernetes_deployment_v1" "mtn_gh_mad_api_egapay" {
  metadata {
    name      = "mtngh-mad-api-egapay"
    namespace = var.pay_partners_namespace
  }

  spec {
    replicas = 0//var.min_pod_replicas

    selector {
      match_labels = {
        app = "mtngh-mad-api-egapay"
      }
    }

    template {
      metadata {
        labels = {
          app = "mtngh-mad-api-egapay"
        }
      }

      spec {
        image_pull_secrets {
          name = kubernetes_secret_v1.dockerconfigjson.metadata.0.name
        }
        container {
          image             = "eganowdevops/mtngh-egapay-partner-api:latest"
          name              = "mtngh-mad-api-egapay"
          image_pull_policy = "Always"

          env {
            name  = "API_VERSION"
            value = "1.0.0-prod"
          }
          env {
            name  = "ACTIVE_PRODUCT_TYPE"
            value = "0"
          }
          env {
            name  = "ENV"
            value = "production"
          }
          env {
            name  = "TRANSACTION_CALLBACK_URL"
            value = "https://${digitalocean_record.mtngh_mad_api_egapay.name}.${var.domain_name}/api/v1/transactions/mtn-momo/callback"
          }
          env {
            name  = "REDIS_HOST"
            value = "${helm_release.mtn_redis.name}-${helm_release.mtn_redis.chart}"
          }
          env {
            name  = "REDIS_PORT"
            value = "6379"
          }
          env {
            name  = "REDIS_PASSWORD"
            value = ""
          }

          port {
            container_port = 80
            name           = "http"
          }

          port {
            container_port = 443
            name           = "grpc"
          }
        }
      }
    }

    strategy {
      type = "RollingUpdate"
      rolling_update {
        max_surge       = "25%"
        max_unavailable = "25%"
      }
    }
  }
}

resource "kubernetes_deployment_v1" "mtn_gh_mad_api_pospay" {
  metadata {
    name      = "mtngh-mad-api-pospay"
    namespace = var.pay_partners_namespace
  }

  spec {
    replicas = 0//var.min_pod_replicas

    selector {
      match_labels = {
        app = "mtngh-mad-api-pospay"
      }
    }

    template {
      metadata {
        labels = {
          app = "mtngh-mad-api-pospay"
        }
      }

      spec {
        image_pull_secrets {
          name = kubernetes_secret_v1.dockerconfigjson.metadata.0.name
        }
        container {
          image             = "eganowdevops/mtngh-pospay-partner-api:latest"
          name              = "mtngh-mad-api-pospay"
          image_pull_policy = "Always"

          env {
            name  = "API_VERSION"
            value = "1.0.0-prod"
          }
          env {
            name  = "ACTIVE_PRODUCT_TYPE"
            value = "1"
          }
          env {
            name  = "ENV"
            value = "production"
          }
          env {
            name  = "TRANSACTION_CALLBACK_URL"
            value = "https://${digitalocean_record.mtngh_mad_api_pospay.name}.${var.domain_name}/api/v1/transactions/mtn-momo/callback"
          }
          env {
            name  = "REDIS_HOST"
            value = "${helm_release.mtn_redis.name}-${helm_release.mtn_redis.chart}"
          }
          env {
            name  = "REDIS_PORT"
            value = "6379"
          }
          env {
            name  = "REDIS_PASSWORD"
            value = ""
          }

          port {
            container_port = 80
            name           = "http"
          }

          port {
            container_port = 443
            name           = "grpc"
          }
        }
      }
    }

    strategy {
      type = "RollingUpdate"
      rolling_update {
        max_surge       = "25%"
        max_unavailable = "25%"
      }
    }
  }
}

resource "kubernetes_deployment_v1" "ndc_volta_ussd" {
  metadata {
    name      = "ndc-volta-ussd"
    namespace = var.pay_partners_namespace
  }

  spec {
    replicas = var.min_pod_replicas

    selector {
      match_labels = {
        app = "ndc-volta-ussd"
      }
    }

    template {
      metadata {
        labels = {
          app = "ndc-volta-ussd"
        }
      }

      spec {
        image_pull_secrets {
          name = kubernetes_secret_v1.dockerconfigjson.metadata.0.name
        }
        container {
          image             = "eganowdevops/eganow-ndc-volta-ussd-dotnet-api:latest"
          name              = "ndc-volta-ussd"
          image_pull_policy = "Always"

          port {
            container_port = 80
            name           = "http"
          }
        }
      }
    }

    strategy {
      type = "RollingUpdate"
      rolling_update {
        max_surge       = "25%"
        max_unavailable = "25%"
      }
    }
  }
}

resource "kubernetes_deployment_v1" "ndc_volta_api" {
  metadata {
    name      = "ndc-volta-api"
    namespace = var.pay_partners_namespace
  }

  spec {
    replicas = var.min_pod_replicas

    selector {
      match_labels = {
        app = "ndc-volta-api"
      }
    }

    template {
      metadata {
        labels = {
          app = "ndc-volta-api"
        }
      }

      spec {
        image_pull_secrets {
          name = kubernetes_secret_v1.dockerconfigjson.metadata.0.name
        }
        container {
          image             = "eganowdevops/eganow-ndc-volta-dotnet-api:latest"
          name              = "ndc-volta-api"
          image_pull_policy = "Always"

          port {
            container_port = 80
            name           = "grpc"
          }
        }
      }
    }

    strategy {
      type = "RollingUpdate"
      rolling_update {
        max_surge       = "25%"
        max_unavailable = "25%"
      }
    }
  }
}

resource "kubernetes_deployment_v1" "ndc_volta_callback" {
  metadata {
    name      = "ndc-volta-callback"
    namespace = var.pay_partners_namespace
  }

  spec {
    replicas = var.min_pod_replicas

    selector {
      match_labels = {
        app = "ndc-volta-callback"
      }
    }

    template {
      metadata {
        labels = {
          app = "ndc-volta-callback"
        }
      }

      spec {
        image_pull_secrets {
          name = kubernetes_secret_v1.dockerconfigjson.metadata.0.name
        }
        container {
          image             = "eganowdevops/eganow-ndc-volta-callback-dotnet-api:latest"
          name              = "ndc-volta-callback"
          image_pull_policy = "Always"

          port {
            container_port = 80
            name           = "http"
          }
        }
      }
    }

    strategy {
      type = "RollingUpdate"
      rolling_update {
        max_surge       = "25%"
        max_unavailable = "25%"
      }
    }
  }
}
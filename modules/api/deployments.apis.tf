resource "kubernetes_deployment_v1" "mtn_gh_mad_api_name_enquiry" {
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
}
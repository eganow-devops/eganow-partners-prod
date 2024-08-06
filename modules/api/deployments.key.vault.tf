resource "kubernetes_deployment_v1" "onepassword" {
  metadata {
    name      = "onepassword-connect"
    namespace = var.pay_partners_namespace
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "onepassword-connect"
      }
    }
    template {
      metadata {
        labels = {
          app = "onepassword-connect"
        }
      }
      spec {
        volume {
          name = "shared-data"
          empty_dir {}
        }
        volume {
          name = "credentials"
          secret {
            secret_name = kubernetes_secret_v1.onepassword_connect.metadata.0.name
          }
        }

        init_container {
          name  = "sqlite-permissions"
          image = "alpine:3.12"
          command = [
            "/bin/sh",
            "-c",
          ]
          args = [
            "mkdir -p /home/opuser/.op/data && chown -R 999 /home/opuser && chmod -R 700 /home/opuser && chmod -f -R 600 /home/opuser/.op/config || :"
          ]
          volume_mount {
            mount_path = "/home/opuser/.op/data"
            name       = "shared-data"
          }
        }

        container {
          name  = "api"
          image = "1password/connect-api:latest"
          resources {
            limits = {
              cpu    = "0.2"
              memory = "128Mi"
            }
          }
          port {
            name           = "api"
            container_port = 8080
          }
          env {
            name  = "OP_SESSION"
            value = "/home/opuser/.config/1password-credentials.json"
          }
          volume_mount {
            mount_path = "/home/opuser/.op/data"
            name       = "shared-data"
          }

          volume_mount {
            mount_path = "/home/opuser/.config"
            name       = "credentials"
            read_only  = true
          }

          liveness_probe {
            http_get {
              path = "/heartbeat"
              port = "api"
            }
            initial_delay_seconds = 3
            period_seconds        = 3
          }

          readiness_probe {
            http_get {
              path = "/health"
              port = "api"
            }
            initial_delay_seconds = 5
            period_seconds        = 5
          }
        }

        container {
          name  = "sync"
          image = "1password/connect-sync:latest"
          resources {
            limits = {
              cpu    = "0.2"
              memory = "128Mi"
            }
          }
          port {
            name           = "sync"
            container_port = 8081
          }
          env {
            name  = "OP_SESSION"
            value = "/home/opuser/.config/1password-credentials.json"
          }
          env {
            name  = "OP_HTTP_PORT"
            value = "8081"
          }

          volume_mount {
            mount_path = "/home/opuser/.op/data"
            name       = "shared-data"
          }
          volume_mount {
            mount_path = "/home/opuser/.config"
            name       = "credentials"
            read_only  = true
          }

          liveness_probe {
            http_get {
              path = "/heartbeat"
              port = "sync"
            }
            initial_delay_seconds = 3
            period_seconds        = 3
          }

          readiness_probe {
            http_get {
              path = "/health"
              port = "sync"
            }
            initial_delay_seconds = 5
            period_seconds        = 5
          }
        }
      }
    }
  }
}
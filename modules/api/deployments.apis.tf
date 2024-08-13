# resource "kubernetes_deployment_v1" "egapay_mtn_gh" {
#   metadata {
#     name      = var.egapay_mtn_gh
#     namespace = var.project_namespace
#   }
#
#   spec {
#     replicas = 1
#
#     selector {
#       match_labels = {
#         app = var.egapay_mtn_gh
#       }
#     }
#
#     template {
#       metadata {
#         labels = {
#           app = var.egapay_mtn_gh
#         }
#       }
#
#       spec {
#         image_pull_secrets {
#           name = var.image_pull_secret
#         }
#         container {
#           image             = "eganowdevops/mtngh-egapay-partner-api:latest"
#           name              = var.egapay_mtn_gh
#           image_pull_policy = "Always"
#
#           port {
#             container_port = 443
#             name           = "grpc"
#           }
#
#           port {
#             container_port = 80
#             name           = "http"
#           }
#
#           env {
#             name  = "API_VERSION"
#             value = "0.0.3-prod-go"
#           }
#
#           env {
#             name  = "ACTIVE_PRODUCT_TYPE"
#             value = "0"
#           }
#
#           env {
#             name  = "ENV"
#             value = "production"
#           }
#
#           env {
#             name  = "TRANSACTION_CALLBACK_URL"
#             value = var.transaction_callback_url
#           }
#
#           env {
#             name  = "REDIS_HOST"
#             value = helm_release.redis.outputs.0.host
#           }
#
#           env {
#             name  = "REDIS_PORT"
#             value = helm_release.redis.outputs.0.port
#           }
#
#           env {
#             name  = "REDIS_PASSWORD"
#             value = helm_release.redis.outputs.0.password
#           }
#
#           env {
#             name  = "OP_CONNECT_HOST"
#             value = "http://${kubernetes_service_v1.onepassword.metadata.0.name}:${kubernetes_service_v1.onepassword.spec.0.port.0.port}"
#           }
#
#           env {
#             name = "OP_VAULT"
#             value_from {
#               secret_key_ref {
#                 key  = var.op_vault_key
#                 name = var.op_vault_secret
#               }
#             }
#           }
#
#           env {
#             name = "OP_CONNECT_TOKEN"
#             value_from {
#               secret_key_ref {
#                 key  = var.op_token_key
#                 name = var.op_vault_secret
#               }
#             }
#           }
#         }
#       }
#     }
#
#     strategy {
#       type = "RollingUpdate"
#       rolling_update {
#         max_surge       = "25%"
#         max_unavailable = "25%"
#       }
#     }
#   }
# }
#
# resource "kubernetes_service_v1" "egapay_mtn_gh" {
#   metadata {
#     name      = var.egapay_mtn_gh
#     namespace = var.project_namespace
#   }
#
#   spec {
#     selector = {
#       app = var.egapay_mtn_gh
#     }
#
#     port {
#       name        = "http"
#       port        = 80
#       target_port = kubernetes_deployment_v1.egapay_mtn_gh.spec.0.template.0.spec.0.container.0.port.1.container_port
#     }
#
#     port {
#       name        = "grpc"
#       port        = 443
#       target_port = kubernetes_deployment_v1.egapay_mtn_gh.spec.0.template.0.spec.0.container.0.port.0.container_port
#     }
#   }
# }
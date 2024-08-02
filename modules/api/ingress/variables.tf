variable "project_namespace" {
  description = "The default namespace of the current project"
  type        = string
}

variable "cluster_issuer" {
  description = "The cluster issuer to use for the ingress"
  type        = string
}

variable "domain_name" {
  description = "The domain name to use for the ingress"
  type        = string
}

variable "svc_egapay_mtn_gh" {
  description = "The service name of the mtngh-egapay service"
  type        = string
}

variable "default_grpc_service_port_name" {
  description = "The default gRPC service port name"
  type        = string
  default     = "grpc"
}
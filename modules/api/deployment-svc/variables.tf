variable "project_namespace" {
  description = "The namespace of the project"
  type        = string
}

variable "egapay_mtn_gh" {
  description = "The name of the egapay-mtn-gh resource"
  type        = string
  default     = "egapay-mtn-gh"
}

variable "image_pull_secret" {
  description = "The name of the image pull secret"
  type        = string
}

variable "transaction_callback_url" {
  description = "The transaction callback url"
  type        = string
  default     = "https://mtngh-egapay." + var.domain_name + "/api/v1/transactions/mtn-momo/callback"
}

variable "op_connect_host" {
  description = "The host of the OP Connect"
  type        = string
}

variable "op_vault_key" {
  description = "The key of the OP Vault"
  type        = string
}

variable "op_token_key" {
  description = "The key of the OP Token"
  type        = string
}

variable "op_vault_secret" {
  description = "The secret of the OP Vault"
  type        = string
}
variable "do_token" {
  sensitive   = true
  description = "DigitalOcean API token"
  type        = string
}

variable "cluster_region" {
  description = "The region in which the cluster will be created"
  default     = "fra1"
  type        = string
}

variable "cluster_k8s_version_prefix" {
  description = "The version prefix of Kubernetes to use in the cluster"
  default     = "1.30."
  type        = string
}

variable "cluster_eganow_name" {
  description = "The name of the Kubernetes cluster"
  default     = "eganow-partners"
  type        = string
}

variable "cluster_eganow_vpc_ip_range" {
  description = "The IP range of the VPC"
  default     = "10.106.10.0/24"
}

variable "cluster_eganow_node_pool_size" {
  description = "The size of the node pool"
  default     = "s-4vcpu-8gb-amd"
  type        = string
}

variable "cluster_node_autoscale_min_count" {
  description = "The minimum number of nodes in the node pool"
  default     = 1
  type        = number
}

variable "cluster_node_autoscale_max_count" {
  description = "The maximum number of nodes in the node pool"
  default     = 5
  type        = number
}

variable "cluster_maintenance_start_time" {
  description = "The time of day when maintenance operations will be performed"
  default     = "00:00"
  type        = string
}

variable "cluster_maintenance_day" {
  description = "The day of the week when maintenance operations will be performed"
  default     = "sunday"
  type        = string
}

variable "eganow_inbound_source_address" {
  type = set(string)
  description = "The source addresses for the inbound rules for cluster"
  default = ["0.0.0.0/0", "::/0"]
}

variable "eganow_outbound_source_address" {
  type = set(string)
  description = "The source addresses for the outbound rules for cluster"
  default = ["0.0.0.0/0", "::/0"]
}
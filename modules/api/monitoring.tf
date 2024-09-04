resource "helm_release" "newrelic" {
  chart            = "nri-bundle"
  name             = "core-newrelic-bundle"
  repository       = "https://helm-charts.newrelic.com"
  version          = var.newrelic_version
  create_namespace = true
  namespace        = var.newrelic_namespace

  cleanup_on_fail = true

  set {
    name  = "global.licenseKey"
    value = var.newrelic_license_key
  }

  set {
    name  = "global.cluster"
    value = var.newrelic_cluster_name
  }

  set {
    name  = "newrelic-logging.lowDataMode"
    value = "true"
  }

  set {
    name  = "newrelic-infrastructure.privileged"
    value = "true"
  }

  set {
    name  = "newrelic-prometheus-agent.enabled"
    value = "true"
  }

  set {
    name  = "newrelic-prometheus-agent.lowDataMode"
    value = "true"
  }

  set {
    name  = "logging.enabled"
    value = "true"
  }

  set {
    name  = "kube-state-metrics.enabled"
    value = "false"
  }

  set {
    name  = "kube-state-metrics.image.tag"
    value = var.newrelic_kube_state_metrics_version
  }

  set {
    name  = "kubeEvents.enabled"
    value = "true"
  }

  set {
    name  = "newrelic-prometheus-agent.config.kubernetes.integrations_filter.enabled"
    value = "false"
  }
}
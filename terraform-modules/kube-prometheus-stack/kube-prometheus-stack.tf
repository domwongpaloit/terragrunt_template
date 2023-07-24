resource "helm_release" "kube-prometheus-stack" {
  name             = var.kube-prometheus-stack-release-name
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = var.kube-prometheus-stack-release-name
  version          = "45.29.0"
  namespace        = "monitoring"
  create_namespace = true
  cleanup_on_fail  = true

  set {
    name  = "prometheus.prometheusSpec.podMonitorSelectorNilUsesHelmValues"
    value = "false"
  }

  set {
    name  = "prometheus.prometheusSpec.serviceMonitorSelectorNilUsesHelmValues"
    value = "false"
  }

  set {
    name  = "grafana.adminPassword"
    value = "admin"
  }
}

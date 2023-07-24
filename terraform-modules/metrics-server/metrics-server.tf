resource "helm_release" "metrics-server" {
  name             = "metrics-server"
  repository       = "https://kubernetes-sigs.github.io/metrics-server"
  chart            = "metrics-server"
  version          = "3.10.0"
  namespace        = "monitoring"
  create_namespace = true
  cleanup_on_fail  = true
}

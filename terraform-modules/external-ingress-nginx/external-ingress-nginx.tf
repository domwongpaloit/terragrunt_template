resource "helm_release" "external_ingress_nginx" {
  name = var.ingress_name

  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  namespace        = "ingress-nginx"
  create_namespace = true
  version          = "4.6.1"

  set {
    name  = "controller.ingressClassResource.name"
    value = "external-ingress-nginx"
  }

  set {
    name  = "controller.metrics.enabled"
    value = "true"
  }

  set {
    name  = "controller.metrics.serviceMonitor.enabled"
    value = "true"
  }

  set {
    name  = "controller.metrics.serviceMonitor.additionalLabels.release"
    value = "kube-prometheus-stack"
  }

  ## Important If you don't have specific host name, otherwise no data will be shown!!!!
  set {
    name  = "controller.extraArgs.metrics-per-host"
    value = "false"
  }

  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-type"
    value = "nlb"
  }

  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-internal"
    value = "false"
  }


  set {
    name  = "controller.service.annotations.prometheus\\.io/scrape"
    value = "true"
  }

  set {
    name  = "controller.service.annotations.prometheus\\.io/port"
    value = "10254"
  }


  set {
    name  = "controller.podAnnotations.prometheus\\.io/scrape"
    value = "true"
  }

  set {
    name  = "controller.podAnnotations.prometheus\\.io/port"
    value = "10254"
  }

  set {
    name  = "controller.podAnnotations.linkerd\\.io/inject"
    value = "enabled"
  }

  set {
    name  = "controller.replicaCount"
    value = "1"
  }

  # If need to define specific node group for different type of instance
  # set {
  #   name  = "controller.nodeSelector.role"
  #   value = "ingress-nodes"
  # }

  set {
    name  = "controller.tolerations[0].key"
    value = "service"
  }

  set {
    name  = "controller.tolerations[0].value"
    value = "ingress"
  }

  set {
    name  = "controller.tolerations[0].operator"
    value = "Equal"
  }

  set {
    name  = "controller.tolerations[0].effect"
    value = "NoExecute"
  }
}

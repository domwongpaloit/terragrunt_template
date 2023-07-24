# # helm repo add argo https://argoproj.github.io/argo-helm
# # helm repo update
# # helm install argocd -n argocd --create-namespace argo/argo-cd --version 3.35.4 -f terraform/values/argocd.yaml
resource "helm_release" "argocd" {
  name = "argocd"

  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = true
  version          = "3.35.4"

  values = [file(var.argocd_values_path)]
}


# # helm repo add argo https://argoproj.github.io/argo-helm
# # helm repo update
# # helm install updater -n argocd argo/argocd-image-updater --version 0.8.4 -f terraform/values/image-updater.yaml
resource "helm_release" "updater" {
  name = "updater"

  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argocd-image-updater"
  namespace        = "argocd"
  create_namespace = true
  version          = "0.8.4"

  values = [file(var.argocd_image_updater_values_path)]
}


# # helm repo add chartmuseum https://chartmuseum.github.io/charts
# # helm install chartmuseum -n chartmuseum --create-namespace chartmuseum/chartmuseum --version 3.9.3 -f terraform/values/chartmuseum.yaml
resource "helm_release" "chartmuseum" {
  name = "chartmuseum"

  repository       = "https://chartmuseum.github.io/charts"
  chart            = "chartmuseum"
  namespace        = "chartmuseum"
  create_namespace = true
  version          = "3.9.3"

  values = [file(var.chart_museum_values_path)]
}

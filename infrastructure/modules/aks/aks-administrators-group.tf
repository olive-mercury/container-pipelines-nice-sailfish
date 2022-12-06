resource "azuread_group" "aks_administrators" {
  description             = "Kubernetes administrators for the ${local.aks_cluster_name} cluster."
  display_name            = "${local.aks_cluster_name}-administrators"
  mail_enabled            = false
  prevent_duplicate_names = true
  security_enabled        = true
}
locals {
  kube_config = data.azurerm_kubernetes_cluster.aks.kube_admin_config.0
  instance_id = { for k, v in data.azurerm_resource_group.rg : k => v.tags["instance_id"] }
}

data "azurerm_resource_group" "rg" {
  for_each = {
    env = var.resource_group_name
    ops = var.ops_resource_group_name
  }

  name = each.value
}

data "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-${local.instance_id["env"]}-${var.environment}"
  resource_group_name = data.azurerm_resource_group.rg["env"].name
}

data "azurerm_subnet" "aks" {
  name                 = "aks-subnet"
  virtual_network_name = "vnet-${data.azurerm_kubernetes_cluster.aks.name}"
  resource_group_name  = data.azurerm_resource_group.rg["env"].name
}

data "azurerm_key_vault" "config" {
  name                = "kv-${local.instance_id["ops"]}"
  resource_group_name = data.azurerm_resource_group.rg["ops"].name
}

data "azurerm_key_vault_secret" "tls" {
  for_each = {
    cert = "${var.environment}-jamesrcounts-com-cert"
    key  = "${var.environment}-jamesrcounts-com-key"
  }

  key_vault_id = data.azurerm_key_vault.config.id
  name         = each.value
}

resource "kubernetes_namespace" "apps" {
  metadata {
    name = "apps"
  }
}

resource "kubernetes_cluster_role_binding" "view" {
  metadata {
    name = "default-view"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "view"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "default"
    namespace = "apps"
  }
}

resource "helm_release" "nginx_ingress" {
  chart        = "ingress-nginx"
  name         = "gateway"
  namespace    = kubernetes_namespace.apps.metadata.0.name
  repository   = "https://kubernetes.github.io/ingress-nginx"
  reuse_values = true

  set {
    name  = "controller.extraArgs.default-ssl-certificate"
    value = "${kubernetes_secret.tls.metadata.0.namespace}/${kubernetes_secret.tls.metadata.0.name}"
  }

  set {
    name  = "controller.kind"
    value = "DaemonSet"
  }

  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/azure-load-balancer-internal"
    value = "true"
  }

  set {
    name  = "controller.service.externalTrafficPolicy"
    value = "Local"
  }

  set {
    name  = "controller.service.enableHttp"
    value = "false"
  }

  set {
    name  = "controller.service.loadBalancerIP"
    value = cidrhost(data.azurerm_subnet.aks.address_prefixes.0, 250)
  }

  set {
    name  = "controller.service.ports.https"
    value = "443"
  }
}

resource "kubernetes_secret" "tls" {
  type = "kubernetes.io/tls"

  metadata {
    name      = "ingress-tls"
    namespace = kubernetes_namespace.apps.metadata.0.name
  }

  data = {
    "tls.crt" = data.azurerm_key_vault_secret.tls["cert"].value
    "tls.key" = data.azurerm_key_vault_secret.tls["key"].value
  }
}
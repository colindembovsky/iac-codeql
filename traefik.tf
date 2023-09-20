resource "azurerm_public_ip" "pip" {
  name                = "cdminPip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  domain_name_label   = var.domain_name_label
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "kubernetes_namespace" "bikeappns" {
  metadata {
    name = var.namespace
  }
}

data "template_file" "traefik_vals" {
  template = file("${path.module}/traefik-values.tpl")
  vars = {
    lb_ip   = azurerm_public_ip.pip.ip_address
    rg_name = azurerm_resource_group.rg.name
  }
}

resource "helm_release" "traefik" {
  depends_on = [
    kubernetes_namespace.bikeappns,
    time_sleep.wait_30_seconds_for_rbac
  ]

  chart      = "traefik"
  name       = "traefik"
  namespace  = var.namespace
  repository = "https://helm.traefik.io/traefik"
  version    = "10.21.1"

  values = [data.template_file.traefik_vals.rendered]
}
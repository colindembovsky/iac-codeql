terraform {

  required_version = ">=1.2"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.7.0"
    }
    time       = "~>0.7.2"
    random     = "~>3.3.1"
    kubernetes = "~>2.11.0"
    template   = "~>2.2.0"
    helm       = "~>2.5.1"
  }

  backend "azurerm" {
    resource_group_name  = "cd-mindaro-shared"
    storage_account_name = "cdminshared"
    container_name       = "tfstate"
    key                  = "dev.mindaro.tfstate"
  }
}

provider "azurerm" {
  features {}
}

provider "helm" {
  kubernetes {
    host                   = azurerm_kubernetes_cluster.k8s.kube_config[0].host
    username               = azurerm_kubernetes_cluster.k8s.kube_config[0].username
    password               = azurerm_kubernetes_cluster.k8s.kube_config[0].password
    client_certificate     = base64decode(azurerm_kubernetes_cluster.k8s.kube_config[0].client_certificate)
    client_key             = base64decode(azurerm_kubernetes_cluster.k8s.kube_config[0].client_key)
    cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.k8s.kube_config[0].cluster_ca_certificate)
  }
}

provider "kubernetes" {
  host                   = azurerm_kubernetes_cluster.k8s.kube_config[0].host
  username               = azurerm_kubernetes_cluster.k8s.kube_config[0].username
  password               = azurerm_kubernetes_cluster.k8s.kube_config[0].password
  client_certificate     = base64decode(azurerm_kubernetes_cluster.k8s.kube_config[0].client_certificate)
  client_key             = base64decode(azurerm_kubernetes_cluster.k8s.kube_config[0].client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.k8s.kube_config[0].cluster_ca_certificate)
}
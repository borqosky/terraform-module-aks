provider "azurerm" {
    version = "~> 1.32.0"
}

provider "random" {
    version = "~> 2.1.2"
}

provider "kubernetes" {
    version                 = "~> 1.8.1"
    host                    = "${azurerm_kubernetes_cluster.aks.kube_config.0.host}"
    client_certificate      = "${base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate)}"
    client_key              = "${base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.client_key)}"
    cluster_ca_certificate  = "${base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.cluster_ca_certificate)}"
}
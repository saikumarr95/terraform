data "azurerm_subnet" "virtualSubnets1" {
  name                 = "sn-staiopsstorage-eus"
  virtual_network_name = "vnet-cis-aiops-d-eus"
  resource_group_name  = var.resource_group_name
}
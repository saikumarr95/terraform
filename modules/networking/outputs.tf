output "resource_group_name" {
    value = azurerm_virtual_network.appnetwork.resource_group_name
  
}
output "location" {
    value = azurerm_virtual_network.appnetwork.location
  
}
output "subnetid" {
    value = azurerm_subnet.subnetA.id
  
}
output "subnet" {
    value = azurerm_subnet.subnetA
  
}
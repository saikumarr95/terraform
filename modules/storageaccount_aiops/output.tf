output "private_endpoint_id" {  
  value = azurerm_private_endpoint.storage_account_private_endpoint.id  
}  
#output "private_dns_zone_id" {  
#  value = azurerm_private_dns_zone.storage_account_dns_zone.id  
#} 
# Fetch subnet_id
output "virtualnetwork_subnets_ids" {
  value = data.azurerm_subnet.virtualSubnets1.*.id
}
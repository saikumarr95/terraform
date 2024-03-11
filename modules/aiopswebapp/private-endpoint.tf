resource "azurerm_private_endpoint" "aiops_webapp_endpoint" {  
  name                = "${var.aiops_webapp_name}-endpoint"  
  location            = var.location  
  resource_group_name = var.resource_group_name  
  subnet_id           = var.subnet_id  
  private_service_connection {  
    name                           = "${var.aiops_webapp_name}-connection"  
    private_connection_resource_id = azurerm_linux_web_app.aiops_webapp.id  
    is_manual_connection           = false  
    subresource_names              = ["https"]  
  }  
}  
resource "azurerm_private_dns_zone" "private_dns_zone" {  
  name                = var.private_dns_zone_name  
  resource_group_name = var.resource_group_name  
}  
resource "azurerm_private_dns_zone_virtual_network_link" "dns_zone_link" {  
  name                  = "${var.aiops_webapp_name}-dns-zone-link"  
  resource_group_name   = var.resource_group_name  
  private_dns_zone_name = azurerm_private_dns_zone.private_dns_zone.name  
  virtual_network_id    = var.vnet_id  
  registration_enabled  = true  
  depends_on = [  
    azurerm_private_endpoint.aiops_webapp_endpoint  
  ]  
}  
resource "azurerm_dns_a_record" "aiops_webapp_dns" {  
  name                = var.aiops_webapp_name  
  zone_name           = var.private_dns_zone_name  
  resource_group_name = var.resource_group_name  
  ttl                 = 300  
  records             = [azurerm_linux_web_app.aiops_webapp.default_site_hostname]  
  depends_on = [  
    azurerm_private_dns_zone_virtual_network_link.dns_zone_link  
  ]  
}  
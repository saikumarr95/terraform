resource "azurerm_private_endpoint" "generic_private_endpoint" {
  name                = var.private_endpoint_name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = flatten(data.azurerm_subnet.virtualSubnets1.*.id)[0] 

  private_service_connection {
    name                           = var.private_service_connection
    private_connection_resource_id = var.resource_id
    is_manual_connection           = false
    subresource_names              = [var.subresource_name]
  }

  lifecycle {
    ignore_changes = [
      tags, 
      private_dns_zone_group,
    ]
  }
}
/*
resource "azurerm_resource_group" "appgrp" {
  name     = "TF_CGP_PRD_EDAS_BWK"
  location = "South Africa North"
  tags = merge(local.tags, {
    comments = "Azure with Terraform"
  })

}
*/
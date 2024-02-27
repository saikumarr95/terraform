/* 
provider "azurerm" {
  #version = "=3.70.0"
  features {}
}

provider "random" {
  #version = "=3.5.1"
}
*/
terraform {

  backend "azurerm" {
    # ----------------------
    # Will be passing in these arguments via CLI as the state file \
    #  is now being overwritten via local testing environments
    # > https://developer.hashicorp.com/terraform/language/settings/backends/configuration#command-line-key-value-pairs
    # ----------------------
    # e.g: terraform init \
    #        -backend-config="resource_group_name=rg-automation-aks-np-eastus"     \
    #        -backend-config="storage_account_name=stvirtutfaksnpeastus" \
    #        -backend-config="container_name=terraform"       \
    #        -backend-config="key=tfstate/vrtuaksnp/terraform.tfvars" \
    #        -backend-config="access_key="
    # ----------------------
    # resource_group_name  = "rg-automation-aks-np-eastus"
    # storage_account_name = "stvirtutfaksnpeastus"
    # container_name       = "terraform"
    # key                  = "tfstate/vrtuaksnp/terraform.tfvars"
    # access_key           = ""
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.89"
    }
    azapi = {
      source = "Azure/azapi"
    }
    azuread = {
      source = "hashicorp/azuread"
      # version = "=2.7.0"
    }
  }
}

# Configure the Microsft Azure provider
provider "azurerm" {
  skip_provider_registration = true
  features {}
  # ----------------------
  # Authenticate the Azure Provider using a Service Principal
  # > https://learn.microsoft.com/en-us/azure/developer/terraform/authenticate-to-azure?tabs=bash
  # ----------------------
  # tenant_id       = var.connect_tenant_id
  # subscription_id = var.connect_subscription_id
  # client_id       = var.connect_client_id
  # client_secret   = var.connect_client_secret
}

provider "azapi" {
  skip_provider_registration = true
  # tenant_id       = var.connect_tenant_id
  # subscription_id = var.connect_subscription_id
  # client_id       = var.connect_client_id
  # client_secret   = var.connect_client_secret
}
/*terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.88.0"
  }
}
}
*/

terraform {
  required_version = ">=1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}
provider "azurerm" {
  # Configuration options
  subscription_id = "cd5f02be-91d1-468d-b07e-53e7dd78050b"
  tenant_id = "44016d2f-7564-435e-95f6-d8a671d51457"
  client_id = "2d650c3c-05e3-4b01-8f3f-334df32f1d44"
  client_secret = "si38Q~zPPw~Gh4NzcRcUnY~tXy6LBeOdEVYwKbeQ"
  features {}

}
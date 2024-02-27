locals {
  tags = {
    Budget      = "5000"
    Cost_Center = "CC510"
    Entity      = "BWK"
    Environment = "PRODUCTION"
    Location    = "South Africa North"
    Owner       = "Cloud Team"
    Project     = "EDAS"
    Quota       = "5000"
    Type        = "MLDATA"
    Workload    = "EDAS Resources"
  }
}


locals {
  resource_group_name = "TF_CGP_PRD_EDAS_BWK"
  location            = "South Africa North"
  virtual_network = {
    name          = "BWK_PRD_VNET_01"
    address_space = "10.50.0.0/24"
  }

  subnets = [
    {
      name           = "default"
      address_prefix = "10.50.0.0/26"
    },
    {
      name           = "Data"
      address_prefix = "10.50.0.64/26"
    },
    {
      name           = "compute"
      address_prefix = "10.50.0.160/27"
    },
    {
      name           = "databrickspv"
      address_prefix = "10.50.0.128/28"
    },
    {
      name           = "databrickspu"
      address_prefix = "10.50.0.144/28"
    }
  ]
}

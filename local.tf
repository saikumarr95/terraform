locals {
  tags = {
    Client_Facing       = ""
    Cost_Center         = ""
    Division            = ""
    DMZ                 = ""
    Env                 = ""
    GBU                 = ""
    Operational_Hours   = ""
    Primary_Application = ""
    Region              = ""
    Regulation          = ""
    Support_Owner_Email = ""
    Type                = ""

  }
}


locals {
  resource_group_name = "rg-Fabric-Corp-Terraform-001"
  location            = "EAST US"
  virtual_network = {
    name          = "vnet-cis-fabric-p-eus"
    address_space = "10.204.205.0/24"
  }

  subnets = [
    {
      name           = "default"
      address_prefix = "10.204.205.0/26"
    }
  ]
}

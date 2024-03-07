module "modules_storageaccount" {
source = "./modules/storageaccount"
resource_group_name = "rg-Fabric-Corp-Terraform-001"
location = "eastus"
}
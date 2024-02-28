variable "resource_group_name" {
  type=string
  description = "This defines the Webapp ai resource group name"
}
variable "location" {
  type=string
  description = "This defines the Webapp location of resource"
}

variable "storageaccount_name" {
  type=string
  description = "This defines the Webapp service name."
}

variable "storageacc_account_tier" {
  type=string
  description = "This defines the Webapp stack name."
}
variable "storage_account_replication_type" {
  type=string
  description = "This defines the stack version."
}

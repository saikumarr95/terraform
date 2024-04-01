variable "resource_group_name" {
  type=string
  description = "This defines the Azure search resource group name"
}
variable "location" {
  type=string
  description = "This defines the Azure search location of resource"
}
variable "azure_search_service_name" {
  type=string
  description = "This defines the Azure search service name."
}
variable "sku" {
  description = "The pricing tier of the search service you want to create (for example, basic or standard)."
  default     = "standard"
  type        = string
  validation {
    condition     = contains(["free", "basic", "standard", "standard2", "standard3", "storage_optimized_l1", "storage_optimized_l2"], var.sku)
    error_message = "The sku must be one of the following values: free, basic, standard, standard2, standard3, storage_optimized_l1, storage_optimized_l2."
  }
}
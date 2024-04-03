
variable "azure_search" {
  type = object({
    resource_group_name = string
    location = string
    service_name = string
    sku = string
  })
  description = "This defines the Azure search configuration."
  validation {
    condition     = contains(["free", "basic", "standard", "standard2", "standard3", "storage_optimized_l1", "storage_optimized_l2"], var.azure_search.sku)
    error_message = "The sku must be one of the following values: free, basic, standard, standard2, standard3, storage_optimized_l1, storage_optimized_l2."
  }
}
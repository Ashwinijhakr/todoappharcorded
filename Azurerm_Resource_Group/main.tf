resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

variable "resource_group_name" {
  # description = "The name of the resource group."
  # type        = string
  
}
variable "resource_group_location" {
  # description = "The Azure location where the resource group will be created."
  # type        = string
  # default     = "East US"
}
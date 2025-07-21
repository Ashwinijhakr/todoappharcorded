variable "nic_name" {
   
}
variable "location" {
  
}
variable "resource_group_name" {
  
}

variable "vm_name" {
  
}
variable "vm_size" {
  
}
# variable "admin_username" {
  
# }
# variable "admin_password" {
#   description = "The password for the administrator account on the virtual machine."
#   type        = string
#   sensitive   = true
# }
variable "image_publisher" {
#   description = "The publisher of the image to use for the virtual machine."
#   type        = string

}
variable "image_offer" {
#   description = "The offer of the image to use for the virtual machine."
#   type        = string          
  
}
variable "image_sku" {
#   description = "The SKU of the image to use for the virtual machine."
#   type        = string                        
  
}
variable "subnet_name" {
  description = "The name of the subnet where the virtual machine will be deployed."
  type        = string
  
}
variable "virtual_network_name" {
  description = "The name of the virtual network where the subnet is located."
  type        = string
  
}
variable "public_ip_name" {
  description = "The name of the public IP address associated with the virtual machine."
  type        = string

}


module "rg" {
  source                  = "../Azurerm_Resource_Group"
  resource_group_name     = "rg-ashwini"
  resource_group_location = "centralindia"
}

module "vnet" {
  depends_on          = [module.rg]
  source              = "../Azurerm_Virtual_network"
  vnet_name           = "vnet-ashwini"
  address_space       = ["10.0.0.0/16"]
  location            = "centralindia"
  resource_group_name = "rg-ashwini"
}
module "frontend_subnet" {
  depends_on          = [module.vnet]
  source              = "../Azurerm_Subnet"
  subnet_name         = "frontend-ashsubnet"
  resource_group_name = "rg-ashwini"
  vnet_name           = "vnet-ashwini"
  address_prefixes    = ["10.0.1.0/24"]

}
module "backend_subnet" {
  depends_on          = [module.vnet]
  source              = "../Azurerm_Subnet"
  subnet_name         = "backend-ashsubnet"
  resource_group_name = "rg-ashwini"
  vnet_name           = "vnet-ashwini"
  address_prefixes    = ["10.0.2.0/24"]

}
module "frontend_pip" {
  depends_on          = [module.rg]
  source              = "../Azurerm_public_IP"
  public_ip_name      = "pip-ashwini-frontend"
  resource_group_name = "rg-ashwini"
  location            = "centralindia"
  allocation_method   = "Static"
}
module "backend_pip" {
  depends_on          = [module.rg]
  source              = "../Azurerm_public_IP"
  public_ip_name      = "pip-ashwini-backend"
  resource_group_name = "rg-ashwini"
  location            = "centralindia"
  allocation_method   = "Static"
}
module "frontend_vm" {
  depends_on           = [module.frontend_subnet, module.frontend_pip]
  source               = "../Azurerm_Virtual_Machine"
  nic_name             = "nic-ashwini-frontend"
  location             = "centralindia"
  resource_group_name  = "rg-ashwini"
  vm_name              = "vm-ashwini-frontend"
  vm_size              = "Standard_B1s"
  image_publisher      = "Canonical"
  image_offer          = "0001-com-ubuntu-server-jammy"
  image_sku            = "22_04-lts-gen2"
  subnet_name          = "frontend-ashsubnet"
  virtual_network_name = "vnet-ashwini"
  public_ip_name       = "pip-ashwini-frontend"

}



module "backend_vm" {
  depends_on           = [module.backend_subnet, module.backend_pip]
  source               = "../Azurerm_Virtual_Machine"
  nic_name             = "nic-ashwini-backend"
  location             = "centralindia"
  resource_group_name  = "rg-ashwini"
  vm_name              = "vm-ashwini-backend"
  vm_size              = "Standard_B1s"
  image_publisher      = "Canonical"
  image_offer          = "0001-com-ubuntu-server-jammy"
  image_sku            = "22_04-lts-gen2"
  subnet_name          = "backend-ashsubnet"
  virtual_network_name = "vnet-ashwini"
  public_ip_name       = "pip-ashwini-backend"

}
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.32.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  subscription_id = "5d1da8c6-c1dd-436c-b5a9-d2829de796dc"
  features {}
}
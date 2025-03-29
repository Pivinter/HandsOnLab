terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.43.0"
    }
  }
  cloud {

    organization = "Vladusalvink"

    workspaces {
      name = "HandsOnLab"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "813-6b8314be-hands-on-with-terraform-on-azure"
  location = "eastus"
}

module "security" {
    source  = "app.terraform.io/Vladusalvink/security/azurerm"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "storagenamehfu38dn3j"
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.22.0"
    }
  }
}
provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "clementrg" {
  name     = "perso_clement"
  location = "West Europe"

  tags = {
    "environment" = "dev"
  }
}

resource "azurerm_virtual_network" "clementvn" {
  name                = "clementnetwork"
  resource_group_name = azurerm_resource_group.clementrg.name
  location            = azurerm_resource_group.clementrg.location
  address_space       = ["10.123.0.0/16"]

  tags = {
    "environment" = "dev"
  }
}
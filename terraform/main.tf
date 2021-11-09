terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.84.0"
    }
  }  
}

provider "azurerm" {
  # Configuration options
  features {
    
  }
}

resource "azurerm_resource_group" "default" {
  name     = var.resource_group_name
  location = var.location
}

data "azurerm_resource_group" "network" {
    name = var.virtual_network_resource_group_name        
}


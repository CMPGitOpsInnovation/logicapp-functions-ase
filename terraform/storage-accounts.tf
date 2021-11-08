resource "azurerm_storage_account" "default" {
  name                = "staspcmpgitops"
  resource_group_name = azurerm_resource_group.default.name
  location            = azurerm_resource_group.default.location

  account_tier             = "Standard"
  account_replication_type = "LRS"

  network_rules {
    default_action = "Deny"
    bypass = ["AzureServices"]
  }
  
}

resource "azurerm_storage_account" "backend" {
  name                = "stbackcmpgitops"
  resource_group_name = azurerm_resource_group.default.name
  location            = azurerm_resource_group.default.location

  account_tier             = "Standard"
  account_replication_type = "LRS"

  network_rules {
    default_action = "Deny"
    bypass = ["AzureServices"]
  }

  tags = {}
}

/*
resource "azurerm_storage_account" "abbstg" {
  name                = "abbstg001"
  resource_group_name = "RG_Abbas"
  location            = "EastUS"

  min_tls_version          = "TLS1_2"
  account_tier             = "Standard"  
  account_replication_type = "LRS"

  network_rules {
    default_action = "Deny"
    bypass = ["AzureServices"]
  }
}
*/
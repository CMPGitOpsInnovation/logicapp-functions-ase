resource "azurerm_storage_account" "logicapps" {
  name                = "staspcmpgitops"
  resource_group_name = azurerm_resource_group.logicapps.name
  location            = azurerm_resource_group.logicapps.location

  account_tier             = "Standard"
  account_replication_type = "LRS"

  network_rules {
    default_action = "Deny"
    bypass = ["AzureServices"]
  }
  
}

resource "azurerm_storage_account" "target" {
  name                = "stbackcmpgitops"
  resource_group_name = azurerm_resource_group.logicapps.name
  location            = azurerm_resource_group.logicapps.location

  account_tier             = "Standard"
  account_replication_type = "LRS"

  network_rules {
    default_action = "Deny"
    bypass = ["AzureServices"]
  }

  tags = {}
}

resource "azurerm_storage_account" "functions" {
  name                = "staspcmpgitopsla"
  resource_group_name = azurerm_resource_group.functions.name
  location            = azurerm_resource_group.functions.location

  account_tier             = "Standard"
  account_replication_type = "LRS"

  network_rules {
    default_action = "Deny"
    bypass = ["AzureServices"]
  }
  
}
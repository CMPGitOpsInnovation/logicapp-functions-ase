resource "azurerm_logic_app_standard" "default" {
    name                = "cmpgitopslogicapptf"
    location            = azurerm_resource_group.logicapps.location
    resource_group_name = azurerm_resource_group.logicapps.name
  
    app_service_plan_id         = azurerm_app_service_plan.logicapps.id
    storage_account_name        = azurerm_storage_account.logicapps.name
    storage_account_access_key  = azurerm_storage_account.logicapps.primary_access_key 
    storage_account_share_name  = ""    
    https_only                  = true    

    site_config {
        vnet_route_all_enabled = "1"
    }

    app_settings = {
        "WEBSITE_VNET_ROUTE_ALL"    = "1"
        "WEBSITE_CONTENTOVERVNET"   = "1"
        "minTlsVersion"             = "1.2"
    }
}
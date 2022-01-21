resource "azurerm_app_service_plan" "logicapps" {

    name                        = "asp-logicapp"
    location                    = azurerm_resource_group.logicapps.location
    resource_group_name         = azurerm_resource_group.logicapps.name
    kind                        = "Windows"
    reserved                    = false

    app_service_environment_id  = azurerm_app_service_environment_v3.default.id
    
    sku {
        tier = "IsolatedV2"
        size = "I1v2"
        capacity = 1
    }
}

resource "azurerm_app_service_plan" "functions" {

    name                        = "asp-functions"
    location                    = azurerm_resource_group.functions.location
    resource_group_name         = azurerm_resource_group.functions.name
    kind                        = "Windows"
    reserved                    = false

    app_service_environment_id  = azurerm_app_service_environment_v3.default.id
    
    sku {
        tier = "IsolatedV2"
        size = "I1v2"
        capacity = 1
    }
}
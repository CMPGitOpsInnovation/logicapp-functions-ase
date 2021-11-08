resource "azurerm_app_service_plan" "default" {

    name                        = "asp-logicapp"
    location                    = azurerm_resource_group.default.location
    resource_group_name         = azurerm_resource_group.default.name
    kind                        = "Windows"
    reserved                    = false

    app_service_environment_id  = azurerm_app_service_environment_v3.default.id
    
    sku {
        tier = "IsolatedV2"
        size = "I1v2"
        capacity = 1
    }
}
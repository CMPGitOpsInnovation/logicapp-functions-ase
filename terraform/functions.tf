resource "azurerm_function_app" "default" {
  name                       = "cmpgitopsfunctionstf"
  location                   = azurerm_resource_group.functions.location
  resource_group_name        = azurerm_resource_group.functions.name
  app_service_plan_id        = azurerm_app_service_plan.functions.id
  storage_account_name       = azurerm_storage_account.functions.name
  storage_account_access_key = azurerm_storage_account.functions.primary_access_key

  https_only = true
}
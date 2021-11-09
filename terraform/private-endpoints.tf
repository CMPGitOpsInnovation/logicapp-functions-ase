resource "azurerm_private_endpoint" "example" {
    name                = "pl-logicapp-storage-account"
    location            = azurerm_resource_group.default.location
    resource_group_name = azurerm_resource_group.default.name
    subnet_id           = data.azurerm_subnet.private_endpoints.id

    private_service_connection {
        name                            = "plc-logicapp-storage-account"
        is_manual_connection            = false
        private_connection_resource_id  = azurerm_storage_account.default.id
        subresource_names               = [ "blob" ]    
    }
}
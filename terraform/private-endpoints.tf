variable "subresource" {
    type    = list(string)
    default = ["blob", "queue", "table"]
}

resource "azurerm_private_endpoint" "logicapps" {

    for_each = toset(var.subresource)

    name                = "pl-logicapp-storage-account-${each.value}"
    location            = azurerm_resource_group.logicapps.location
    resource_group_name = azurerm_resource_group.logicapps.name
    subnet_id           = data.azurerm_subnet.private_endpoints.id

    private_service_connection {
        name                            = "plc-logicapp-storage-account-${each.value}"
        is_manual_connection            = false
        private_connection_resource_id  = azurerm_storage_account.logicapps.id
        subresource_names               = [ each.value ]
    }
}

resource "azurerm_private_endpoint" "functions" {

    for_each = toset(var.subresource)

    name                = "pl-functions-storage-account-${each.value}"
    location            = azurerm_resource_group.functions.location
    resource_group_name = azurerm_resource_group.functions.name
    subnet_id           = data.azurerm_subnet.private_endpoints.id

    private_service_connection {
        name                            = "plc-functions-storage-account-${each.value}"
        is_manual_connection            = false
        private_connection_resource_id  = azurerm_storage_account.functions.id
        subresource_names               = [ each.value ]
    }
}
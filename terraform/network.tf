data "azurerm_virtual_network" "default" {
    name                = var.virtual_network_name
    resource_group_name = data.azurerm_resource_group.network.name
}

data "azurerm_subnet" "default" {
    virtual_network_name    = data.azurerm_virtual_network.default.name
    resource_group_name     = data.azurerm_resource_group.network.name
    name                    = var.default_subnet
}

data "azurerm_subnet" "private_endpoints"{
    virtual_network_name    = data.azurerm_virtual_network.default.name
    resource_group_name     = data.azurerm_resource_group.network.name
    name                    = var.private_endpoint_subnet
}
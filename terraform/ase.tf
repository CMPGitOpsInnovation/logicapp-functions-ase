resource "azurerm_app_service_environment_v3" "default" {
    name                = "cmpgitopsasev3"
    resource_group_name = azurerm_resource_group.default.name
    subnet_id           = data.azurerm_subnet.default.id

    internal_load_balancing_mode = "Web, Publishing"

    cluster_setting {
        name  = "DisableTls1.0"
        value = "1"
    }

    cluster_setting {
        name  = "InternalEncryption"
        value = "true"
    }

    cluster_setting {
        name  = "FrontEndSSLCipherSuiteOrder"
        value = "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256"
    }
}
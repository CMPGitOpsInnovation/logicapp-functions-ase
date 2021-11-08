variable "resource_group_name" {
  type      = string
  default   = "rg-logicapp"
}

variable "location" {
  type      = string
  default   = "EastUS"
}

variable "virtual_network_resource_group_name" {
  type      = string
  default   = "rg-networking"
}

variable "virtual_network_name"{
    type    = string
    default = "vnet-workloads-eastus-001"
}
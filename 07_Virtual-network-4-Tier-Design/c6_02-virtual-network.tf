# create a virtual network
resource "azurerm_virtual_network" "vnet" {
    name = "${local.resource_name_prefix}-${var.vnet_name}"
    address_space = var.vnet_address_space
    location = azurerm_resource_group.ajithrg1.location
    resource_group_name = azurerm_resource_group.ajithrg1.name #(resource type.resource_local name.argument)
    tags = local.common_tags
}

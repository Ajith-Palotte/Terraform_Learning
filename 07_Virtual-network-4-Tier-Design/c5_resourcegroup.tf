#resource-1 Azure Resource group
resource "azurerm_resource_group" "ajithrg1" {
    #name = "${local.resource_name_prefix}-${var.resource_group_name}"
    name = "${local.resource_name_prefix}-${var.resource_group_name}-${random_string.myrandom.id}"
    location = var.resource_group_location
    tags = local.common_tags
}



# Create Public IP
resource "azurerm_public_ip" "web_linuxvm_publicip" {
  name                = "${local.resource_name_prefix}-web-linuxvm-publicip"
  allocation_method   = "Static"
  resource_group_name = azurerm_resource_group.ajithrg1.name
  location            = azurerm_resource_group.ajithrg1.location
  sku                 = "Standard"

}
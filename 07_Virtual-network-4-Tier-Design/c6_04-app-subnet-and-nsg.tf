# Resource -1 Create App tier Subnet.
resource "azurerm_subnet" "appsubnet" {
    name ="${azurerm_virtual_network.vnet.name}-${var.app_subnet_name}" 
    resource_group_name = azurerm_resource_group.ajithrg1.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes = var.app_subnet_address
  
}

# Resource -2 Create Network security group (nsg) web.
resource "azurerm_network_security_group" "app_subnet_nsg" {
  name = "${azurerm_subnet.appsubnet.name}-nsg"
  location = azurerm_resource_group.ajithrg1.location
  resource_group_name = azurerm_resource_group.ajithrg1.name 
}

# Resource -3 : Associate NSG & Subnet
resource "azurerm_subnet_network_security_group_association" "app_subnet_nsg_association" {
  depends_on = [azurerm_network_security_rule.app_nsg_rule_inbound]
  subnet_id = azurerm_subnet.appsubnet.id
  network_security_group_id = azurerm_network_security_group.app_subnet_nsg.id
}

locals {
  app_inbound_ports_map ={
    "100" : "80"
    "110" : "443"
    "120" : "8080"
    "130" : "22"
  }
}

resource "azurerm_network_security_rule" "app_nsg_rule_inbound" {
  for_each = local.app_inbound_ports_map
  name                        = "rule_port_${each.value}"
  priority                    = each.key
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = each.key
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.ajithrg1.name
  network_security_group_name = azurerm_network_security_group.app_subnet_nsg.name
}

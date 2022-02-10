# Resource -1 Create bastion tier Subnet.

resource "azurerm_subnet" "bastionsubnet" {
  name                 = "${azurerm_virtual_network.vnet.name}-${var.bastion_subnet_name}"
  resource_group_name  = azurerm_resource_group.ajithrg1.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.bastion_subnet_address
}

# Resource -2 Create Network security group (nsg) bastion.

resource "azurerm_network_security_group" "bastion_subnet_nsg" {
  name                = "${azurerm_subnet.bastionsubnet.name}-nsg"
  location            = azurerm_resource_group.ajithrg1.location
  resource_group_name = azurerm_resource_group.ajithrg1.name
}

# Resource -3 : Associate NSG & Subnet
resource "azurerm_subnet_network_security_group_association" "bastion_subnet_nsg_association" {
  depends_on = [azurerm_network_security_rule.bastion_nsg_rule_inbound]
  ## Every NSG Rule Association will disassociate NSG from Subnet and Associate it, so we associate it only after NSG is completely created - Azure Provider Bug https://github.com/terraform-providers/terraform-provider-azurerm/issues/354    
  subnet_id                 = azurerm_subnet.bastionsubnet.id
  network_security_group_id = azurerm_network_security_group.bastion_subnet_nsg.id
}

# resource -4 Create NSG rule
## Local Block for security rules
locals {
  bastion_inbound_ports_map = {
    "100" : "3389" ## if key is starts with number must use : instead of =
    "110" : "22"
  }
}
## Nsg Inbound rule for bastion tier Subnets
# 
resource "azurerm_network_security_rule" "bastion_nsg_rule_inbound" {
  for_each                    = local.bastion_inbound_ports_map
  name                        = "Rule_port_${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.ajithrg1.name
  network_security_group_name = azurerm_network_security_group.bastion_subnet_nsg.name

}


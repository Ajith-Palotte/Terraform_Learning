# Virtual Network Outputs
## Virtual Network Name
output "virtual_network_name" {
  description = "virtual network name"
  value = azurerm_virtual_network.vnet.name
}

## Virtual Network ID
output "virtual_network_id" {
  description = "virtual network id"
  value = azurerm_virtual_network.vnet.id
}

# Subnet Outputs (We will write for one web subnet and rest all we will ignore for now)
## Subnet Name 

output "web_subnet_name" {
  description = "Web subnet Name"
  value = azurerm_subnet.websubnet.name
}

## Subnet ID

output "web_subnet_ID" {
  description = "Web subnet ID"
  value = azurerm_subnet.websubnet.id
}

# Network security outputs
## Web subnet NSG name
output "web_subnet_nsg_name" {
  description = "web subnet nsg name"
  value = azurerm_network_security_group.web_subnet_nsg.name
}

## Web subnet NSG ID
output "web_subnet_nsg_id" {
  description = "web subnet nsg id"
  value = azurerm_network_security_group.web_subnet_nsg.id
}



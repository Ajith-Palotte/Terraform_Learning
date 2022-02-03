# Resource -2 Virtual Network.
resource "azurerm_virtual_network" "myvnet" {
  name = "myvnet-1"
  address_space = [ "10.0.0.0/16" ]
  location = azurerm_resource_group.ajithrg1.location
  resource_group_name = azurerm_resource_group.ajithrg1.name
  tags = {
      "Name" = "myvnet-1"
      "environment" = "Dev"
    }
}


  # resource -3 Subnet
resource "azurerm_subnet" "mysubnet" {
      name = "mysubnet-1"
      resource_group_name = azurerm_resource_group.ajithrg1.name
      virtual_network_name = azurerm_virtual_network.myvnet.name
      address_prefixes = [ "10.0.1.0/24" ]    
}


# resource -4 Create Public IP.
  resource "azurerm_public_ip" "mypublicip" {
    name = "mypublicip-1"
    resource_group_name = azurerm_resource_group.ajithrg1.name
    location = azurerm_resource_group.ajithrg1.location
    allocation_method = "Static"
    tags = {
      "environment" ="Dev"
    }
  }


# Resource -5 Networkm interface

resource "azurerm_network_interface" "myvmnic" {
  name = "vmnic-1"
  location = azurerm_resource_group.ajithrg1.location
  resource_group_name = azurerm_resource_group.ajithrg1.name
  ip_configuration {
    name = "internal"
    subnet_id = azurerm_subnet.mysubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.mypublicip.id
  }
}
   
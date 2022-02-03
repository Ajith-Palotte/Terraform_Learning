# Create resource group with default provider

resource "azurerm_resource_group" "Ajith" {
    name = "Ajith_RG1"
    location = "East US"
}

# Create resource group with default provider-2

resource "azurerm_resource_group" "Ajith-1" {
  name="Ajith_RG2"
  location = "West US"
  provider = azurerm.Provider2-westus

}



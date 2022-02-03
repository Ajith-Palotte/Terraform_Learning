#resource 1

resource "azurerm_resource_group" "AJITH" {
  name = "Ajith_RG1"
  location = "East US"
}

# Resource 2 Random Config

resource "random_string" "randomname" {
    length = 10
    special = false
    upper = false
     
}

# Create Storage Account
resource "azurerm_storage_account" "ajith_sa" {
  name = "ajithsa${random_string.randomname.id}" # 21 Charactor is max
  resource_group_name = azurerm_resource_group.AJITH.name
  location = azurerm_resource_group.AJITH.location
  account_tier = "Standard"
  account_replication_type = "GRS"
  tags = {
    environment = "test"
  } 
}

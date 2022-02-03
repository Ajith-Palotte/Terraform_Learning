terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = ">= 2.88"
    }
  }
}

# provider 1 , Default Provider

provider "azurerm" {
  features {}
}

#Provider-2 for west us

provider "azurerm" {
    features {
     virtual_machine {
      delete_os_disk_on_deletion = false
    }
  }
  alias = "Provider2-westus"
}
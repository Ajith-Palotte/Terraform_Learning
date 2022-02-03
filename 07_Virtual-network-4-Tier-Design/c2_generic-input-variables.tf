#generic input Variables
#Business Division
variable "business_division" {
  description = "Business devision in the org.infrastructure"
  type = string
  default = "sap"
}

#environment variable

variable "environment" {
  description = "Env. variable used as prefix"
  type = string
  default = "dev"
}

#Resource Group Name
variable "resource_group_name" {
    description = "Resource group Name"
    type = string
    default = "ajithrg-default"
}


#Resource Group Location 
variable "resource_group_location" {
    description = "Region in which Azure resource to be created"
    type = string
    default = "eastus2"
}



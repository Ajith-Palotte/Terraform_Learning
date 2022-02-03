# Virtual Network , Subnet & Subnet NSG's

# Virtual Network Vnet name

variable "vnet_name" {
    description = "virtual network name"
    type = string
    default = "vnet_default"
}

# virtual network Address space

variable "vnet_address_space" {
    description = "Virtual Network Address Space"
    type = list(string)
    default = [ "10.0.0.0/16" ]
}

#web Subnet Name
variable "web_subnet_name" {
    description = "Virtual network web subnet name"
    type = string
    default = "websubnet"
}

# web subnet Address space

variable "web_subnet_address" {
  description = "virtual network web subnet address space"
  type = list(string)
  default = [ "10.0.1.0/24" ]
}

# App Subnet Name
variable "app_subnet_name" {
    description = "Virtual network app subnet name"
    type = string
    default = "appsubnet"
}

# app subnet Address space

variable "app_subnet_address" {
  description = "virtual network app subnet address space"
  type = list(string)
  default = [ "10.0.11.0/24" ]
}

# db Subnet Name
variable "db_subnet_name" {
    description = "Virtual network db subnet name"
    type = string
    default = "dbsubnet"
}

# db subnet Address space

variable "db_subnet_address" {
  description = "virtual network db subnet address space"
  type = list(string)
  default = [ "10.0.21.0/24" ]
}


# Bastion / mgmt subnet name
variable "bastion_subnet_name" {
    description = "Virtual network bastion subnet name"
    type = string
    default = "bastionsubnet"
}

# Bastion / mgmt Address space

variable "bastion_subnet_address" {
  description = "virtual network bastion subnet address space"
  type = list(string)
  default = [ "10.0.100.0/24" ]
}
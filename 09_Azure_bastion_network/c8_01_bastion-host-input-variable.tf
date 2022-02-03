# Bastion linux vm input variable 

variable "bastion_service_subnet_name" {
  description = "Bastion service subnet"
  default     = "AzureBastionSubnet"
}

variable "bastion_service_address_prefixes" {
  description = "Bastion service address prefixes"
  default     = ["10.0.101.0/27"]
}
variable "environment" {
  description = "The Environment that this resource belongs in"
  default = "dev"
}

variable "location" {
  description = "The Azure data center"
  default = "West US"
}

variable "resourcegroup_name" {
  description = "The name of the resource group"
  default = "prakash_test"
}
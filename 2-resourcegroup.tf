resource "azurerm_resource_group" "example" {
  name     = var.resourcegroup_name
  location = var.location

  tags = {
    environment = var.environment 
  }
}
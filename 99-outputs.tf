output "resource_group_id" {
  value = azurerm_resource_group.example.id
}

output "resource_group_name" {
  value = azurerm_resource_group.example.name
}

output "resource_group_location" {
  value = azurerm_resource_group.example.location
}

output "public_subnet" {
  value = azurerm_subnet.subnet1.id
}

output "application_subnet" {
  value = azurerm_subnet.subnet2.id
}

output "database_subnet" {
  value = azurerm_subnet.subnet2.id
}

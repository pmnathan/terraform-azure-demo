module "network" {
  source      = "../"
  environment = "production"
  location    = "West US"
  resourcegroup_name = "microsoft_csa_test"
}

resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location            = module.network.resource_group_location
  resource_group_name = module.network.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = module.network.application_subnet
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "example" {
  name                = "example-machine"
  resource_group_name = module.network.resource_group_name
  location            = module.network.resource_group_location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}
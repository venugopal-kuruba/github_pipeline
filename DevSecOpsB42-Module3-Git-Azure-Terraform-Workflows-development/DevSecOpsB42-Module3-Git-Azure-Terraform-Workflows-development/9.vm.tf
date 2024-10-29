#Define locals
locals {
  env   = lower(var.env)
  batch = lower(var.batch)
}

# Create Virtual Machines public-ip
resource "azurerm_public_ip" "vm1" {
  sku                 = "Standard"
  name                = "vms-pip-1"
  location            = azurerm_resource_group.devsecopsb40-rg1.location
  resource_group_name = azurerm_resource_group.devsecopsb40-rg1.name
  allocation_method   = "Static"
  tags = {
    Env   = local.env
    Batch = local.batch
  }
}

# Create Virtual Machine Network Interface
resource "azurerm_network_interface" "vm1" {
  name                = "vms-nic-1"
  location            = azurerm_resource_group.devsecopsb40-rg1.location
  resource_group_name = azurerm_resource_group.devsecopsb40-rg1.name
  ip_configuration {
    name                          = "vms-ipconfig-1"
    subnet_id                     = azurerm_subnet.devsecopsb40-subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm1.id
  }
  tags = {
    Env   = local.env
    Batch = local.batch
  }
}

# Create Azure Linux Virtual Machines
resource "azurerm_linux_virtual_machine" "vm1" {
  name                            = "${azurerm_resource_group.devsecopsb40-rg1.name}-vm-1"
  resource_group_name             = azurerm_resource_group.devsecopsb40-rg1.name
  location                        = azurerm_resource_group.devsecopsb40-rg1.location
  size                            = var.vm_size
  admin_username                  = var.admin_username
  admin_password                  = random_password.server_passwords.0.result
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.vm1.id
  ]
  os_disk {
    name                 = "vm1OSDisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = "30"
  }
  identity {
    type = "SystemAssigned"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal-daily"
    sku       = "20_04-daily-lts-gen2"
    version   = "latest"
  }
  tags = {
    Env   = local.env
    Batch = local.batch
    Owner = "JavaAppTeam"
    Approver = "DevSecOpsTeam"
    Valid = "April 30th 2024"
  }
}

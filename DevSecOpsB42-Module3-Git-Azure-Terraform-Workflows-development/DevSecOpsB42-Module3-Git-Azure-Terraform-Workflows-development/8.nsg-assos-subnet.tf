resource "azurerm_subnet_network_security_group_association" "subnet1" {
  subnet_id                 = azurerm_subnet.devsecopsb40-subnet1.id
  network_security_group_id = azurerm_network_security_group.devsecopsb40nsg.id
}

resource "azurerm_subnet_network_security_group_association" "subnet2" {
  subnet_id                 = azurerm_subnet.devsecopsb40-subnet2.id
  network_security_group_id = azurerm_network_security_group.devsecopsb40nsg.id
}

resource "azurerm_subnet_network_security_group_association" "subnet3" {
  subnet_id                 = azurerm_subnet.devsecopsb40-subnet3.id
  network_security_group_id = azurerm_network_security_group.devsecopsb40nsg.id
}

resource "azurerm_subnet_network_security_group_association" "subnet4" {
  subnet_id                 = azurerm_subnet.devsecopsb40-subnet4.id
  network_security_group_id = azurerm_network_security_group.devsecopsb40nsg.id
}
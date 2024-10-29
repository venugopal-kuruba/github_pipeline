#Terraform has two types of dependencies.
# 1. Implicit dependencies: These are dependencies that are not explicitly defined 
#    in the configuration file. Terraform automatically detects these dependencies 
#    and creates the resources in the correct order.

# Creating Virtual Network
resource "azurerm_virtual_network" "devsecopsb40-vnet1" {
  name = "${azurerm_resource_group.devsecopsb40-rg1.name}-vnet1"
  #Implicit dependency on resource group location
  location = azurerm_resource_group.devsecopsb40-rg1.location
  #Implicit dependency on resource group name
  resource_group_name = azurerm_resource_group.devsecopsb40-rg1.name
  address_space       = var.vnet1_address_space
}

# Creating devsecopsb40-subnet1
resource "azurerm_subnet" "devsecopsb40-subnet1" {
  name = "${azurerm_resource_group.devsecopsb40-rg1.name}-subnet1"
  #Implicit dependency on resource group name
  resource_group_name = azurerm_resource_group.devsecopsb40-rg1.name
  #Implicit dependency on virtual network name
  virtual_network_name = azurerm_virtual_network.devsecopsb40-vnet1.name
  address_prefixes     = var.subnet1_cidr_block
}

# Creating devsecopsb40-subnet2
resource "azurerm_subnet" "devsecopsb40-subnet2" {
  name = "${azurerm_resource_group.devsecopsb40-rg1.name}-subnet2"
  #Implicit dependency on resource group name
  resource_group_name = azurerm_resource_group.devsecopsb40-rg1.name
  #Implicit dependency on virtual network name
  virtual_network_name = azurerm_virtual_network.devsecopsb40-vnet1.name
  address_prefixes     = var.subnet2_cidr_block
  depends_on           = [azurerm_subnet.devsecopsb40-subnet1]
}

# Creating devsecopsb40-subnet3
resource "azurerm_subnet" "devsecopsb40-subnet3" {
  name = "${azurerm_resource_group.devsecopsb40-rg1.name}-subnet3"
  #Implicit dependency on resource group name
  resource_group_name = azurerm_resource_group.devsecopsb40-rg1.name
  #Implicit dependency on virtual network name
  virtual_network_name = azurerm_virtual_network.devsecopsb40-vnet1.name
  address_prefixes     = var.subnet3_cidr_block
  depends_on           = [azurerm_subnet.devsecopsb40-subnet2]
}

# Creating devsecopsb40-subnet4
resource "azurerm_subnet" "devsecopsb40-subnet4" {
  name = "${azurerm_resource_group.devsecopsb40-rg1.name}-subnet4"
  #Implicit dependency on resource group name
  resource_group_name = azurerm_resource_group.devsecopsb40-rg1.name
  #Implicit dependency on virtual network name
  virtual_network_name = azurerm_virtual_network.devsecopsb40-vnet1.name
  address_prefixes     = var.subnet4_cidr_block
  depends_on           = [azurerm_subnet.devsecopsb40-subnet3]
}
# resource "azurerm_storage_account" "devsecopsb40-tfstate" {
#   name                     = "devsecopsb40tfstate"
#   resource_group_name      = azurerm_resource_group.devsecopsb40-rg1.name
#   location                 = azurerm_resource_group.devsecopsb40-rg1.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
#   tags = {
#     env   = "development"
#     batch = "DevSecOpsB40"
#     owner = "JavaAppTeam"
#   }
#   #Explicit dependency on Subnet 4
#   depends_on = [azurerm_subnet.devsecopsb40-subnet4]
# }
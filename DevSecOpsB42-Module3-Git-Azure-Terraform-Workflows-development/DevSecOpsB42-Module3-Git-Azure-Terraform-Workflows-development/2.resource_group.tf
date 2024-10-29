resource "azurerm_resource_group" "devsecopsb40-rg1" {
  name     = "${var.rgname}-${var.env}"
  location = var.location
  tags = {
    env   = var.env
    batch = var.batch
    owner = var.owner
  }
}


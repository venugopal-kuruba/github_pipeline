data "azurerm_dns_zone" "azureb45" {
  provider            = azurerm.prod
  name                = var.dns_zone
  resource_group_name = "common-rg"
}

resource "azurerm_dns_a_record" "vm1-dev" {
  provider            = azurerm.prod
  name                = "${var.env}-vm1"
  zone_name           = data.azurerm_dns_zone.azureb45.name
  resource_group_name = data.azurerm_dns_zone.azureb45.resource_group_name
  ttl                 = 300
  records             = ["10.1.1.200"]
}

resource "azurerm_dns_a_record" "vm2-dev" {
  provider            = azurerm.prod
  name                = "${var.env}-vm2"
  zone_name           = data.azurerm_dns_zone.azureb45.name
  resource_group_name = data.azurerm_dns_zone.azureb45.resource_group_name
  ttl                 = 300
  records             = ["10.1.1.201"]
}

resource "azurerm_dns_a_record" "vm3" {
  provider            = azurerm.prod
  name                = "${var.env}-vm3"
  zone_name           = data.azurerm_dns_zone.azureb45.name
  resource_group_name = data.azurerm_dns_zone.azureb45.resource_group_name
  ttl                 = 300
  records             = ["10.1.1.202"]
}

resource "azurerm_dns_a_record" "vm4" {
  provider            = azurerm.prod
  name                = "${var.env}-vm4"
  zone_name           = data.azurerm_dns_zone.azureb45.name
  resource_group_name = data.azurerm_dns_zone.azureb45.resource_group_name
  ttl                 = 300
  records             = ["10.1.1.203"]
}

resource "azurerm_dns_a_record" "vm5" {
  provider            = azurerm.prod
  name                = "${var.env}-vm5"
  zone_name           = data.azurerm_dns_zone.azureb45.name
  resource_group_name = data.azurerm_dns_zone.azureb45.resource_group_name
  ttl                 = 300
  records             = ["10.1.1.205"]
}

resource "azurerm_dns_a_record" "vm6-dev" {
  provider            = azurerm.prod
  name                = "${var.env}-vm6"
  zone_name           = data.azurerm_dns_zone.azureb45.name
  resource_group_name = data.azurerm_dns_zone.azureb45.resource_group_name
  ttl                 = 300
  records             = ["10.1.1.206"]
}


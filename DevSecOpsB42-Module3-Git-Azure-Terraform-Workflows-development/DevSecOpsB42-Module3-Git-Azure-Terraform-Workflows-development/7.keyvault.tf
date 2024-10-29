#element(list, index)
resource "azurerm_key_vault_secret" "passwords" {
  count        = var.env == "dev" ? 5 : 0
  name         = "${var.env}serverpassword${count.index + 1}"
  value        = element(random_password.server_passwords.*.result, count.index)
  key_vault_id = azurerm_key_vault.devsecopsb42kv.id
}


# Datasources for accessing existing keyvault in diffrent subscription(production)
data "azurerm_key_vault" "azureb45kv" {
  count        = var.env == "prod" ? 1 : 0
  provider            = azurerm.prod
  name                = "azureb45kv"
  resource_group_name = "COMMON-RG"
}

#element(list, index)
resource "azurerm_key_vault_secret" "azureb45kv-passwords" {
  provider     = azurerm.prod
  count        = var.env == "prod" ? 5 : 0
  name         = "${var.env}serverpassword${count.index + 1}"
  value        = element(random_password.server_passwords.*.result, count.index)
  key_vault_id = data.azurerm_key_vault.azureb45kv.0.id
}

	
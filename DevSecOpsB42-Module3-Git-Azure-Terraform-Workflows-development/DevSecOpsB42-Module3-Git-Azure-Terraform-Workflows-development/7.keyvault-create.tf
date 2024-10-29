data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "devsecopsb42kv" {
  name                        = "devsecopsb42kv-${var.env}"
  location                    = "eastus"
  resource_group_name         = "common-rg"
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "Get",
        "List",
        "Set",
        "Delete",
        "Backup",
        "Restore",
        "Recover",
        "Purge"   
    ]
  }
}

resource "azurerm_key_vault_access_policy" "example" {
  key_vault_id = azurerm_key_vault.devsecopsb42kv.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = "f8e25567-7af1-4d96-b231-fb09fd41feb7"    # user object id

  secret_permissions = [
      "Get",
        "List",
        "Set",
        "Delete",
        "Backup",
        "Restore",
        "Recover",
        "Purge" 
  ]
}

resource "azurerm_storage_account" "Storage_Accounts" {
  for_each                 = var.storage-Details
  name                     = each.value.storage-name
  location                 = each.value.location
  resource_group_name      = each.value.resource_group_name
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
}

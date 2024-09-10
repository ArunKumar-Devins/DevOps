data "azurerm_subnet" "Subnets" {
  for_each             = var.subnet-details
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}
# data "azurerm_key_vault_secret" "username" {
#   for_each     = var.vms
#   name         = each.value.username_key
#   key_vault_id = data.azurerm_key_vault.kv[each.key].id
# }

# data "azurerm_key_vault_secret" "password" {
#   for_each     = var.vms
#   name         = each.value.password_key
#   key_vault_id = data.azurerm_key_vault.kv[each.key].id
# }

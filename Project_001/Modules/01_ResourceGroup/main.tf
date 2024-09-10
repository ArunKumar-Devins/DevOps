resource "azurerm_resource_group" "Resource_Group" {
  for_each = var.rg-details
  name     = each.value.name
  location = each.value.location
}

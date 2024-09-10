data "azurerm_virtual_network" "Vnets" {
    for_each = var.vnets-details
    name = each.value.name
    resource_group_name = each.value.resource_group_name
}

resource "azurerm_subnet" "Subnets" {
    for_each = var.subnet-details
    name = each.value.name
    resource_group_name = each.value.resource_group_name
    virtual_network_name  = data.azurerm_virtual_network.Vnets[each.key].id
    address_prefixes = each.value.address_prefixes
}
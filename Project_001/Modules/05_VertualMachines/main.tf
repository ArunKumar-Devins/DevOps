data "azurerm_key_vault" "kv" {
  for_each            = var.vm-details
  name                = each.value.kv_name
  resource_group_name = each.value.resource_group_name
}

resource "random_password" "pass" {
  for_each         = var.vm-details
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_key_vault_secret" "password" {
  for_each     = var.vm-details
  name         = "${each.value.vm_name}-password"
  value        = random_password.pass[each.key].result
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}

resource "azurerm_network_interface" "nic" {
  for_each            = var.vm-details
  name                = "${each.value.vm_name}-nic"
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "${each.value.vm_name}-ipc"
    subnet_id                     = data.azurerm_subnet.Subnets[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vms" {
  for_each                        = var.vm-details
  name                            = each.value.vm_name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = "Standard_F2"
  admin_username                  = "${each.value.vm_name}-user"
  admin_password                  = data.azurerm_key_vault.kv[each.key]
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.nic.id, ]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

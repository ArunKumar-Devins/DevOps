rg-details = {
  rg1 = {
    name     = "Tech-RG1"
    location = "eastus"
  }
}
key_vaults = {
  kv1 = {
    kv_name             = "MyAccessKV"
    location            = "eastus"
    resource_group_name = "Tech-RG1"
  }
}
storage-Details = {
  stg1 = {
    name                     = "MyStorage"
    location                 = "eastus"
    resource_group_name      = "Tech-RG1"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}
vnets-details = {
  vnet1 = {
    name                = "MyVnet1"
    location            = "eastus"
    resource_group_name = "Tech-RG1"
    address_space = ["10.0.0.0/16"]
  }
}
subnet-details = {
  subnet1 = {
    name                = "subnet1"
    location            = "eastus"
    resource_group_name = "Tech-RG1"
    address_prefixes = ["10.0.1.0/24"]
  }
}
vm-details = {
    vm1 = {
        vm-name = "Tech-VM01"
        location = "eastus"
        resource_group_name = "Tech-RG1"
    }
     vm2 = {
        vm-name = "Tech-VM02"
        location = "eastus"
        resource_group_name = "Tech-RG1"
    }
     vm3 = {
        vm-name = "Tech-VM03"
        location = "eastus"
        resource_group_name = "Tech-RG1"
    }
}
module "resorce_group" {
    source = "../../Modules/01_ResourceGroup"
    rg-details = var.rg-details
}
module "key-vault" {
    depends_on = [ module.resorce_group ]
    source = "../../Modules/02_KeyVault"
    key_vaults = var.key_vaults
}
module "storage" {
    depends_on = [ module.resorce_group ]
    source = "../../Modules/02_StorageAccounts"
    storage-Details = var.storage-Details 
}
module "virtualnetwork" {
    depends_on = [ module.resorce_group ]
    source = "../../Modules/03_VirtualNetworks"
    vnets-details = var.vnets-details
}
module "subnet" {
    depends_on = [ module.virtualnetwork ]
    source = "../../Modules/04_Subnets"
    subnet-details = var.subnet-details
    vnets-details = var.vnets-details
}
module "vms" {
    depends_on = [ module.subnet ]
    source = "../../Modules/05_VertualMachines"
    vm-details = var.vm-details
    subnet-details = var.subnet-details
  
}
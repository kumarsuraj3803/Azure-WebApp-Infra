module "rg_module" {
  for_each = var.resource_groups

  source   = "../modules/resourceGroup/azurerm_resource_group"
  rg_name  = each.value.name
  location = each.value.location
}


module "vnet_module" {
  source     = "../modules/networking/azurerm_virtual_network"
  depends_on = [module.rg_module]
  vnets      = var.vnets
}

module "nsg_module" {
  source     = "../modules/networking/azurerm_nsg"
  depends_on = [module.rg_module]
  nsg        = var.nsg
}


module "nic_module" {
  source     = "../modules/networking/azurerm_nic"
  depends_on = [module.rg_module, module.vnet_module, module.nsg_module, module.pip_module]
  nics       = var.nics
  pip_ids    = module.pip_module.pip_ids

}

module "pip_module" {
  source     = "../modules/networking/azurerm_pip"
  depends_on = [module.rg_module]
  pips       = var.pips
}

# module "bastion_module" {
#   source     = "../modules/networking/azurerm_bastion"
#   depends_on = [module.rg_module, module.vnet_module, module.pip_module]
#   bastion    = var.bastion
# }

module "nic_nsg_assoc_module" {
  source      = "../modules/networking/azurerm_nic_nsg_assoc"
  depends_on  = [module.nic_module, module.nsg_module]
  nic_nsg_ids = var.nic_nsg_ids
}

module "vm_module" {
  source = "../modules/virtual_machine"

  depends_on = [module.rg_module, module.nic_module]
  vms        = var.vms
}



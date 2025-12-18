terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.41.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "3d1ce785-6c4d-4565-bb5e-3b46939260a6"
}

# terraform {
#   backend "azurerm" {
#     resource_group_name  = "apkeResourceGroupKaNaam"
#     storage_account_name = "aapkeStorageAccountKaNaam"
#     container_name       = "apkeStorageContainerKaNaam"
#     key                  = "apkiStatefileKaNaam.tfstate"
#   }
# }

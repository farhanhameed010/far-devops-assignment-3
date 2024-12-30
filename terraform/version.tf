# File: terraform/versions.tf
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.0"

   backend "azurerm" {
    resource_group_name  = data.azurerm_resource_group.existing_rg.name
    storage_account_name = "YourStorageAccount"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    use_azuread_auth     = true
    }
}
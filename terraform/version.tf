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
    rresource_group_name  = var.ARM_RESOURCE_GROUP_NAME
    storage_account_name = var.ARM_STORAGE_ACCOUNT_NAME
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    use_azuread_auth     = true
    }
}
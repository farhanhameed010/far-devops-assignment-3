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
    resource_group_name  = var.resource_group_name
    storage_account_name = "your-storage-account-name"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    use_azuread_auth     = true
    }
}
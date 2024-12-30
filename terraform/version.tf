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
    use_azuread_auth     = true
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
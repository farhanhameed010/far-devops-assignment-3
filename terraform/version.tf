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
    resource_group_name  = "${var.TF_VAR_resource_group_name}"
    storage_account_name = "tfstate${random_string.suffix.result}"
    container_name       = "tfstate"
    key                 = "terraform.tfstate"
  }
}
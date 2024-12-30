# File: terraform/state-storage.tf
resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

resource "azurerm_storage_account" "state" {
  name                     = "tfstate${random_string.suffix.result}"
  resource_group_name      = data.azurerm_resource_group.existing_rg.name
  location                 = data.azurerm_resource_group.existing_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  blob_properties {
    versioning_enabled = true
  }

  tags = {
    environment = "dev"
  }
}

resource "azurerm_storage_container" "state" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.state.name
  container_access_type = "private"
}

# Add these outputs at the end of your outputs section
output "storage_account_name" {
  value = azurerm_storage_account.state.name
}

output "container_name" {
  value = azurerm_storage_container.state.name
}
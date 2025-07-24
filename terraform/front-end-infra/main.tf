terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 4.37.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "2351fb49-b1a2-4acd-9230-739c76dfa8e5"
}

resource "random_id" "suffix" {
  byte_length = 4
}

resource "azurerm_resource_group" "frontend" {
  name     = "frontend-resource-group"
  location = "East US"
}

resource "azurerm_storage_account" "frontend_storage" {
  name                     = "frontendstor${random_id.suffix.hex}"
  resource_group_name      = azurerm_resource_group.frontend.name
  location                 = azurerm_resource_group.frontend.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  static_website {
    index_document     = "index.html"
    error_404_document = "404.html"
  }
}

resource "azurerm_storage_container" "frontend_container" {
  name                  = "$web"  # Use $web container for static website hosting
  storage_account_name  = azurerm_storage_account.frontend_storage.name
  container_access_type = "blob"
}

output "frontend_url" {
  value       = azurerm_storage_account.frontend_storage.primary_web_endpoint
  description = "URL to access your frontend static website"
}

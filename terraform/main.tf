terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 4.37.0"
    }
    random = {
      source = "hashicorp/random"
      version = ">= 3.0"
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

resource "azurerm_resource_group" "taskflow" {
  name     = "taskflow-resource-group"
  location = "East US"
}

resource "azurerm_service_plan" "taskflow_plan" {
  name                = "taskflow-app-service-plan"
  location            = azurerm_resource_group.taskflow.location
  resource_group_name = azurerm_resource_group.taskflow.name
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "taskflow_app" {
  name                = "taskflow-backend-${random_id.suffix.hex}"
  location            = azurerm_resource_group.taskflow.location
  resource_group_name = azurerm_resource_group.taskflow.name
  service_plan_id     = azurerm_service_plan.taskflow_plan.id

  site_config {
    app_command_line = ""
  }

  app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
    PORT                                 = "3000"
    DOCKER_CUSTOM_IMAGE_NAME            = "rosine22/taskflow-backend:latest"
  }
}


terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "sttfstateyourorg123"
    container_name       = "tfstate"
    key                  = "infrastructure.tfstate"
    use_azuread_auth     = true   # <--- Bypasses listKeys requirement!
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.target_subscription_id
}
provider "azurerm" {
  features {}
}

resource "random_string" "random" {
  length           = 5
  special = false
}

resource "random_id" "this" {
  byte_length = 5
  keepers = {
    trigger = "always_run"
  }
}

resource "azurerm_resource_group" "this" {
  name     = "rg-eus-${var.htmxapp.appname}"
  location = var.htmxapp.location
}
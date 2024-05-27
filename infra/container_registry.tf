resource "azurerm_container_registry" "this" {
  name                = "acreus${var.htmxapp.appname}${random_string.random.result}"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  sku                 = var.htmxapp.acr_sku
  admin_enabled       = var.htmxapp.acr_admin_enabled
}
/*
resource "azurerm_app_service_plan" "this" {
  name                = "appsrvpl-cus-${random_string.random.result}"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  kind                = var.htmxapp.app_service_plan_kind
  reserved            = var.htmxapp.app_service_plan_reserved

  sku {
    tier = var.htmxapp.app_service_plan_sku_tier
    size = var.htmxapp.app_service_plan_sku_size
  }
}

resource "azurerm_app_service" "this" {
  name                = "appsrv-cus-${random_string.random.result}"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  app_service_plan_id = azurerm_app_service_plan.this.id

  site_config {
    linux_fx_version = "DOCKER|${azurerm_container_registry.this.login_server}/${var.htmxapp.app_service_container_image}"
  }

  app_settings = {
    DOCKER_REGISTRY_SERVER_URL      = "https://${azurerm_container_registry.this.login_server}"
    DOCKER_REGISTRY_SERVER_USERNAME = azurerm_container_registry.this.admin_username
    DOCKER_REGISTRY_SERVER_PASSWORD = azurerm_container_registry.this.admin_password
  }
}
*/
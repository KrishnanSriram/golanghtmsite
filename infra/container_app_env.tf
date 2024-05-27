# Container App Environment
resource "azurerm_container_app_environment" "this" {
  name                = "cae${var.htmxapp.appname}${random_string.random.result}"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
}

resource "azurerm_user_assigned_identity" "this" {
  location            = azurerm_resource_group.this.location
  name                = "umi_esu_acr_access"
  resource_group_name = azurerm_resource_group.this.name
}
resource "azurerm_role_assignment" "containerapp" {
  scope                = azurerm_container_registry.this.id
  role_definition_name = "acrpull"
  principal_id         = azurerm_user_assigned_identity.this.principal_id
}
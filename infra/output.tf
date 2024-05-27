output "rg_name" {
  value = azurerm_resource_group.this.id
}

output "acr_admin_user" {
  value = azurerm_container_registry.this.admin_username
}

output "acr_admin_password" {
  sensitive = true
  value = azurerm_container_registry.this.admin_password
}

output "acr_name" {
  value = azurerm_container_registry.this.name
}

output "acr_login_server" {
  value = azurerm_container_registry.this.login_server
}

output "acr_id" {
  value = azurerm_container_registry.this.id
}

# output "app_service_plan_id" {
#   value = azurerm_app_service_plan.this.id
# }

# output "app_service_plan_name" {
#   value = azurerm_app_service_plan.this.name
# }

# output "app_service_default_site_hostname" {
#   value = azurerm_app_service.this.default_site_hostname
# }

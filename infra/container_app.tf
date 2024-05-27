# Get ACR Login Server (assuming your ACR name matches the registry server name)
# data "azurerm_container_registry" "acr" {
#   name = "acreusqcrvw"
# }

# Container App with Image from ACR
resource "azurerm_container_app" "this" {
  count = var.htmxapp.deploy_container == false ? 0 : 1
  name                = "acpeus${var.htmxapp.appname}"
  resource_group_name = azurerm_resource_group.this.name

  # Reference the existing environment
  container_app_environment_id = azurerm_container_app_environment.this.id

  # Container Configuration
  template {
    container {
      name  = "${var.htmxapp.appname}container"
      image = "${azurerm_container_registry.this.login_server}/${var.htmxapp.app_service_container_image}"
      # Adjust CPU and memory based on your application requirements
      cpu    = 0.5
      memory = "1Gi"
    }
  }

  # Configure ingress for external access
  ingress {
    external_enabled = true
    target_port = 8080
    traffic_weight {
      percentage = 100
      latest_revision = true
    }
  }

  identity {
    type = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.this.id]
  }

  registry {
    server = azurerm_container_registry.this.login_server
    identity = azurerm_user_assigned_identity.this.id
  }

  # Grant access to ACR for the container app (Optional)
  # depends_on = [azurerm_resource_group.container_app_rg]

  # role {
  #   id = "Reader"
  #   assigned_to = azurerm_container_app.gohtmsitecontainer.id
  #   scope = data.azurerm_container_registry.acr.id
  # }
  revision_mode = "Single"
}

variable "htmxapp" {
  type = object({
    appname = string
    location = optional(string, "East US")
    acr_sku = optional(string, "Basic")
    acr_admin_enabled = optional(bool, true)
    app_service_plan_kind = optional(string, "Linux")
    app_service_plan_reserved = optional(bool, true)
    app_service_plan_sku_tier = optional(string, "Basic")
    app_service_plan_sku_size = optional(string, "B1")
    app_service_container_image = optional(string, "golanghtmx:latest")
    deploy_container = optional(bool, false)
  })
  default = {
    appname = "goginhtm"
  }
}


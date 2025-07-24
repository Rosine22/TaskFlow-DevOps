output "app_service_url" {
  value       = "https://${azurerm_linux_web_app.taskflow_app.default_hostname}"
  description = "Public URL of the deployed TaskFlow backend"
}

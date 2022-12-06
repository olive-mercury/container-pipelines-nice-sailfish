module "diagnostics" {
  source = "../diagnostics"

  log_analytics_workspace_id = var.log_analytics_workspace.id

  monitored_services = {
    agw = azurerm_application_gateway.agw.id
    pip = azurerm_public_ip.agw.id
  }
}
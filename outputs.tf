output "kubernetes_flux_configurations_blob_storage" {
  description = "Map of blob_storage values across all kubernetes_flux_configurations, keyed the same as var.kubernetes_flux_configurations"
  value       = { for k, v in azurerm_kubernetes_flux_configuration.kubernetes_flux_configurations : k => v.blob_storage }
  sensitive   = true
}
output "kubernetes_flux_configurations_bucket" {
  description = "Map of bucket values across all kubernetes_flux_configurations, keyed the same as var.kubernetes_flux_configurations"
  value       = { for k, v in azurerm_kubernetes_flux_configuration.kubernetes_flux_configurations : k => v.bucket }
  sensitive   = true
}
output "kubernetes_flux_configurations_cluster_id" {
  description = "Map of cluster_id values across all kubernetes_flux_configurations, keyed the same as var.kubernetes_flux_configurations"
  value       = { for k, v in azurerm_kubernetes_flux_configuration.kubernetes_flux_configurations : k => v.cluster_id }
}
output "kubernetes_flux_configurations_continuous_reconciliation_enabled" {
  description = "Map of continuous_reconciliation_enabled values across all kubernetes_flux_configurations, keyed the same as var.kubernetes_flux_configurations"
  value       = { for k, v in azurerm_kubernetes_flux_configuration.kubernetes_flux_configurations : k => v.continuous_reconciliation_enabled }
}
output "kubernetes_flux_configurations_git_repository" {
  description = "Map of git_repository values across all kubernetes_flux_configurations, keyed the same as var.kubernetes_flux_configurations"
  value       = { for k, v in azurerm_kubernetes_flux_configuration.kubernetes_flux_configurations : k => v.git_repository }
  sensitive   = true
}
output "kubernetes_flux_configurations_kustomizations" {
  description = "Map of kustomizations values across all kubernetes_flux_configurations, keyed the same as var.kubernetes_flux_configurations"
  value       = { for k, v in azurerm_kubernetes_flux_configuration.kubernetes_flux_configurations : k => v.kustomizations }
}
output "kubernetes_flux_configurations_name" {
  description = "Map of name values across all kubernetes_flux_configurations, keyed the same as var.kubernetes_flux_configurations"
  value       = { for k, v in azurerm_kubernetes_flux_configuration.kubernetes_flux_configurations : k => v.name }
}
output "kubernetes_flux_configurations_namespace" {
  description = "Map of namespace values across all kubernetes_flux_configurations, keyed the same as var.kubernetes_flux_configurations"
  value       = { for k, v in azurerm_kubernetes_flux_configuration.kubernetes_flux_configurations : k => v.namespace }
}
output "kubernetes_flux_configurations_scope" {
  description = "Map of scope values across all kubernetes_flux_configurations, keyed the same as var.kubernetes_flux_configurations"
  value       = { for k, v in azurerm_kubernetes_flux_configuration.kubernetes_flux_configurations : k => v.scope }
}


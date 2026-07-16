output "kubernetes_flux_configurations_id" {
  description = "Map of id values across all kubernetes_flux_configurations, keyed the same as var.kubernetes_flux_configurations"
  value       = { for k, v in azurerm_kubernetes_flux_configuration.kubernetes_flux_configurations : k => v.id if v.id != null && length(v.id) > 0 }
}
output "kubernetes_flux_configurations_blob_storage" {
  description = "Map of blob_storage values across all kubernetes_flux_configurations, keyed the same as var.kubernetes_flux_configurations"
  value       = { for k, v in azurerm_kubernetes_flux_configuration.kubernetes_flux_configurations : k => v.blob_storage if v.blob_storage != null && length(v.blob_storage) > 0 }
  sensitive   = true
}
output "kubernetes_flux_configurations_bucket" {
  description = "Map of bucket values across all kubernetes_flux_configurations, keyed the same as var.kubernetes_flux_configurations"
  value       = { for k, v in azurerm_kubernetes_flux_configuration.kubernetes_flux_configurations : k => v.bucket if v.bucket != null && length(v.bucket) > 0 }
  sensitive   = true
}
output "kubernetes_flux_configurations_cluster_id" {
  description = "Map of cluster_id values across all kubernetes_flux_configurations, keyed the same as var.kubernetes_flux_configurations"
  value       = { for k, v in azurerm_kubernetes_flux_configuration.kubernetes_flux_configurations : k => v.cluster_id if v.cluster_id != null && length(v.cluster_id) > 0 }
}
output "kubernetes_flux_configurations_continuous_reconciliation_enabled" {
  description = "Map of continuous_reconciliation_enabled values across all kubernetes_flux_configurations, keyed the same as var.kubernetes_flux_configurations"
  value       = { for k, v in azurerm_kubernetes_flux_configuration.kubernetes_flux_configurations : k => v.continuous_reconciliation_enabled if v.continuous_reconciliation_enabled != null }
}
output "kubernetes_flux_configurations_git_repository" {
  description = "Map of git_repository values across all kubernetes_flux_configurations, keyed the same as var.kubernetes_flux_configurations"
  value       = { for k, v in azurerm_kubernetes_flux_configuration.kubernetes_flux_configurations : k => v.git_repository if v.git_repository != null && length(v.git_repository) > 0 }
  sensitive   = true
}
output "kubernetes_flux_configurations_kustomizations" {
  description = "Map of kustomizations values across all kubernetes_flux_configurations, keyed the same as var.kubernetes_flux_configurations"
  value       = { for k, v in azurerm_kubernetes_flux_configuration.kubernetes_flux_configurations : k => v.kustomizations if v.kustomizations != null && length(v.kustomizations) > 0 }
}
output "kubernetes_flux_configurations_name" {
  description = "Map of name values across all kubernetes_flux_configurations, keyed the same as var.kubernetes_flux_configurations"
  value       = { for k, v in azurerm_kubernetes_flux_configuration.kubernetes_flux_configurations : k => v.name if v.name != null && length(v.name) > 0 }
}
output "kubernetes_flux_configurations_namespace" {
  description = "Map of namespace values across all kubernetes_flux_configurations, keyed the same as var.kubernetes_flux_configurations"
  value       = { for k, v in azurerm_kubernetes_flux_configuration.kubernetes_flux_configurations : k => v.namespace if v.namespace != null && length(v.namespace) > 0 }
}
output "kubernetes_flux_configurations_scope" {
  description = "Map of scope values across all kubernetes_flux_configurations, keyed the same as var.kubernetes_flux_configurations"
  value       = { for k, v in azurerm_kubernetes_flux_configuration.kubernetes_flux_configurations : k => v.scope if v.scope != null && length(v.scope) > 0 }
}


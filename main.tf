resource "azurerm_kubernetes_flux_configuration" "kubernetes_flux_configurations" {
  for_each = var.kubernetes_flux_configurations

  cluster_id                        = each.value.cluster_id
  name                              = each.value.name
  namespace                         = each.value.namespace
  continuous_reconciliation_enabled = each.value.continuous_reconciliation_enabled
  scope                             = each.value.scope

  dynamic "kustomizations" {
    for_each = each.value.kustomizations
    content {
      depends_on                 = kustomizations.value.depends_on
      garbage_collection_enabled = kustomizations.value.garbage_collection_enabled
      name                       = kustomizations.value.name
      path                       = kustomizations.value.path
      dynamic "post_build" {
        for_each = kustomizations.value.post_build != null ? [kustomizations.value.post_build] : []
        content {
          substitute = post_build.value.substitute
          dynamic "substitute_from" {
            for_each = post_build.value.substitute_from != null ? [post_build.value.substitute_from] : []
            content {
              kind     = substitute_from.value.kind
              name     = substitute_from.value.name
              optional = substitute_from.value.optional
            }
          }
        }
      }
      recreating_enabled        = kustomizations.value.recreating_enabled
      retry_interval_in_seconds = kustomizations.value.retry_interval_in_seconds
      sync_interval_in_seconds  = kustomizations.value.sync_interval_in_seconds
      timeout_in_seconds        = kustomizations.value.timeout_in_seconds
      wait                      = kustomizations.value.wait
    }
  }

  dynamic "blob_storage" {
    for_each = each.value.blob_storage != null ? [each.value.blob_storage] : []
    content {
      account_key          = blob_storage.value.account_key
      container_id         = blob_storage.value.container_id
      local_auth_reference = blob_storage.value.local_auth_reference
      dynamic "managed_identity" {
        for_each = blob_storage.value.managed_identity != null ? [blob_storage.value.managed_identity] : []
        content {
          client_id = managed_identity.value.client_id
        }
      }
      sas_token = blob_storage.value.sas_token
      dynamic "service_principal" {
        for_each = blob_storage.value.service_principal != null ? [blob_storage.value.service_principal] : []
        content {
          client_certificate_base64     = service_principal.value.client_certificate_base64
          client_certificate_password   = service_principal.value.client_certificate_password
          client_certificate_send_chain = service_principal.value.client_certificate_send_chain
          client_id                     = service_principal.value.client_id
          client_secret                 = service_principal.value.client_secret
          tenant_id                     = service_principal.value.tenant_id
        }
      }
      sync_interval_in_seconds = blob_storage.value.sync_interval_in_seconds
      timeout_in_seconds       = blob_storage.value.timeout_in_seconds
    }
  }

  dynamic "bucket" {
    for_each = each.value.bucket != null ? [each.value.bucket] : []
    content {
      access_key               = bucket.value.access_key
      bucket_name              = bucket.value.bucket_name
      local_auth_reference     = bucket.value.local_auth_reference
      secret_key_base64        = bucket.value.secret_key_base64
      sync_interval_in_seconds = bucket.value.sync_interval_in_seconds
      timeout_in_seconds       = bucket.value.timeout_in_seconds
      tls_enabled              = bucket.value.tls_enabled
      url                      = bucket.value.url
    }
  }

  dynamic "git_repository" {
    for_each = each.value.git_repository != null ? [each.value.git_repository] : []
    content {
      https_ca_cert_base64     = git_repository.value.https_ca_cert_base64
      https_key_base64         = git_repository.value.https_key_base64
      https_user               = git_repository.value.https_user
      local_auth_reference     = git_repository.value.local_auth_reference
      provider                 = git_repository.value.provider
      reference_type           = git_repository.value.reference_type
      reference_value          = git_repository.value.reference_value
      ssh_known_hosts_base64   = git_repository.value.ssh_known_hosts_base64
      ssh_private_key_base64   = git_repository.value.ssh_private_key_base64
      sync_interval_in_seconds = git_repository.value.sync_interval_in_seconds
      timeout_in_seconds       = git_repository.value.timeout_in_seconds
      url                      = git_repository.value.url
    }
  }
}


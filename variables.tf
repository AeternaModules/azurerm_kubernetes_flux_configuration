variable "kubernetes_flux_configurations" {
  description = <<EOT
Map of kubernetes_flux_configurations, attributes below
Required:
    - cluster_id
    - name
    - namespace
    - kustomizations (block):
        - depends_on (optional)
        - garbage_collection_enabled (optional)
        - name (required)
        - path (optional)
        - post_build (optional, block):
            - substitute (optional)
            - substitute_from (optional, block):
                - kind (required)
                - name (required)
                - optional (optional)
        - recreating_enabled (optional)
        - retry_interval_in_seconds (optional)
        - sync_interval_in_seconds (optional)
        - timeout_in_seconds (optional)
        - wait (optional)
Optional:
    - continuous_reconciliation_enabled
    - scope
    - blob_storage (block):
        - account_key (optional)
        - container_id (required)
        - local_auth_reference (optional)
        - managed_identity (optional, block):
            - client_id (required)
        - sas_token (optional)
        - service_principal (optional, block):
            - client_certificate_base64 (optional)
            - client_certificate_password (optional)
            - client_certificate_send_chain (optional)
            - client_id (required)
            - client_secret (optional)
            - tenant_id (required)
        - sync_interval_in_seconds (optional)
        - timeout_in_seconds (optional)
    - bucket (block):
        - access_key (optional)
        - bucket_name (required)
        - local_auth_reference (optional)
        - secret_key_base64 (optional)
        - sync_interval_in_seconds (optional)
        - timeout_in_seconds (optional)
        - tls_enabled (optional)
        - url (required)
    - git_repository (block):
        - https_ca_cert_base64 (optional)
        - https_key_base64 (optional)
        - https_user (optional)
        - local_auth_reference (optional)
        - provider (optional)
        - reference_type (required)
        - reference_value (required)
        - ssh_known_hosts_base64 (optional)
        - ssh_private_key_base64 (optional)
        - sync_interval_in_seconds (optional)
        - timeout_in_seconds (optional)
        - url (required)
EOT

  type = map(object({
    cluster_id                        = string
    name                              = string
    namespace                         = string
    continuous_reconciliation_enabled = optional(bool, true)
    scope                             = optional(string, "namespace")
    kustomizations = object({
      depends_on                 = optional(list(string))
      garbage_collection_enabled = optional(bool, false)
      name                       = string
      path                       = optional(string)
      post_build = optional(object({
        substitute = optional(map(string))
        substitute_from = optional(object({
          kind     = string
          name     = string
          optional = optional(bool, false)
        }))
      }))
      recreating_enabled        = optional(bool, false)
      retry_interval_in_seconds = optional(number, 600)
      sync_interval_in_seconds  = optional(number, 600)
      timeout_in_seconds        = optional(number, 600)
      wait                      = optional(bool, true)
    })
    blob_storage = optional(object({
      account_key          = optional(string)
      container_id         = string
      local_auth_reference = optional(string)
      managed_identity = optional(object({
        client_id = string
      }))
      sas_token = optional(string)
      service_principal = optional(object({
        client_certificate_base64     = optional(string)
        client_certificate_password   = optional(string)
        client_certificate_send_chain = optional(bool, false)
        client_id                     = string
        client_secret                 = optional(string)
        tenant_id                     = string
      }))
      sync_interval_in_seconds = optional(number, 600)
      timeout_in_seconds       = optional(number, 600)
    }))
    bucket = optional(object({
      access_key               = optional(string)
      bucket_name              = string
      local_auth_reference     = optional(string)
      secret_key_base64        = optional(string)
      sync_interval_in_seconds = optional(number, 600)
      timeout_in_seconds       = optional(number, 600)
      tls_enabled              = optional(bool, true)
      url                      = string
    }))
    git_repository = optional(object({
      https_ca_cert_base64     = optional(string)
      https_key_base64         = optional(string)
      https_user               = optional(string)
      local_auth_reference     = optional(string)
      provider                 = optional(string)
      reference_type           = string
      reference_value          = string
      ssh_known_hosts_base64   = optional(string)
      ssh_private_key_base64   = optional(string)
      sync_interval_in_seconds = optional(number, 600)
      timeout_in_seconds       = optional(number, 600)
      url                      = string
    }))
  }))
}


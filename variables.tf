variable "dataflow_invoke_runs" {
  description = <<EOT
Map of dataflow_invoke_runs, attributes below
Required:
    - compartment_id
Optional:
    - application_id
    - archive_uri
    - arguments
    - asynchronous
    - configuration
    - defined_tags
    - display_name
    - driver_shape
    - execute
    - executor_shape
    - freeform_tags
    - idle_timeout_in_minutes
    - logs_bucket_uri
    - max_duration_in_minutes
    - metastore_id
    - num_executors
    - opc_parent_rpt_url
    - pool_id
    - spark_version
    - type
    - warehouse_bucket_uri
    - application_log_config (block):
        - log_group_id (required)
        - log_id (required)
    - driver_shape_config (block):
        - memory_in_gbs (optional)
        - ocpus (optional)
    - executor_shape_config (block):
        - memory_in_gbs (optional)
        - ocpus (optional)
    - parameters (block):
        - name (required)
        - value (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id          = string
    application_id          = optional(string)
    archive_uri             = optional(string)
    arguments               = optional(list(string))
    asynchronous            = optional(bool)
    configuration           = optional(map(string))
    defined_tags            = optional(map(string))
    display_name            = optional(string)
    driver_shape            = optional(string)
    execute                 = optional(string)
    executor_shape          = optional(string)
    freeform_tags           = optional(map(string))
    idle_timeout_in_minutes = optional(string)
    logs_bucket_uri         = optional(string)
    max_duration_in_minutes = optional(string)
    metastore_id            = optional(string)
    num_executors           = optional(number)
    opc_parent_rpt_url      = optional(string)
    pool_id                 = optional(string)
    spark_version           = optional(string)
    type                    = optional(string)
    warehouse_bucket_uri    = optional(string)
    application_log_config = optional(object({
      log_group_id = string
      log_id       = string
    }))
    driver_shape_config = optional(object({
      memory_in_gbs = optional(number)
      ocpus         = optional(number)
    }))
    executor_shape_config = optional(object({
      memory_in_gbs = optional(number)
      ocpus         = optional(number)
    }))
    parameters = optional(list(object({
      name  = string
      value = string
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}


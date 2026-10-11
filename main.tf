resource "oci_dataflow_invoke_run" "dataflow_invoke_runs" {
  for_each = var.dataflow_invoke_runs

  compartment_id          = each.value.compartment_id
  application_id          = each.value.application_id
  archive_uri             = each.value.archive_uri
  arguments               = each.value.arguments
  asynchronous            = each.value.asynchronous
  configuration           = each.value.configuration
  defined_tags            = each.value.defined_tags
  display_name            = each.value.display_name
  driver_shape            = each.value.driver_shape
  execute                 = each.value.execute
  executor_shape          = each.value.executor_shape
  freeform_tags           = each.value.freeform_tags
  idle_timeout_in_minutes = each.value.idle_timeout_in_minutes
  logs_bucket_uri         = each.value.logs_bucket_uri
  max_duration_in_minutes = each.value.max_duration_in_minutes
  metastore_id            = each.value.metastore_id
  num_executors           = each.value.num_executors
  opc_parent_rpt_url      = each.value.opc_parent_rpt_url
  pool_id                 = each.value.pool_id
  spark_version           = each.value.spark_version
  type                    = each.value.type
  warehouse_bucket_uri    = each.value.warehouse_bucket_uri

  dynamic "application_log_config" {
    for_each = each.value.application_log_config != null ? [each.value.application_log_config] : []
    content {
      log_group_id = application_log_config.value.log_group_id
      log_id       = application_log_config.value.log_id
    }
  }

  dynamic "driver_shape_config" {
    for_each = each.value.driver_shape_config != null ? [each.value.driver_shape_config] : []
    content {
      memory_in_gbs = driver_shape_config.value.memory_in_gbs
      ocpus         = driver_shape_config.value.ocpus
    }
  }

  dynamic "executor_shape_config" {
    for_each = each.value.executor_shape_config != null ? [each.value.executor_shape_config] : []
    content {
      memory_in_gbs = executor_shape_config.value.memory_in_gbs
      ocpus         = executor_shape_config.value.ocpus
    }
  }

  dynamic "parameters" {
    for_each = each.value.parameters != null ? each.value.parameters : []
    content {
      name  = parameters.value.name
      value = parameters.value.value
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}


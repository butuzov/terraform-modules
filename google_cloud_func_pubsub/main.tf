# Terraform Requirements
terraform {
  required_version = ">= 0.12"
}


# Archivating Function directory
data "archive_file" "default" {
  type        = "zip"
  source_dir  = var.path_from
  output_path = format("%s/%s.zip", var.path_to, var.name)
}

# ---- Infrastructure --------------------------------------------

resource "google_storage_bucket_object" "default" {

  bucket = var.bucket
  name   = format("%s/%s.zip", var.path_from, var.name)
  source = data.archive_file.default.output_path

  depends_on = [data.archive_file.default]
}

resource "google_cloudfunctions_function" "default" {
  name        = var.name
  description = var.description

  available_memory_mb = var.memory
  runtime             = var.runtime
  timeout             = var.timeout
  max_instances       = var.max_instances
  entry_point         = var.handler


  source_archive_bucket = var.bucket
  source_archive_object = google_storage_bucket_object.default.name

  environment_variables = var.ENV_VARS

  event_trigger {
    event_type = "google.pubsub.topic.publish"
    resource   = var.topic
  }

  depends_on = [google_storage_bucket_object.default]

  labels = { project = lower(var.project) }
}

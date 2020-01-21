terraform {
  required_version = ">= 0.12"
}

variable "name" { type = string }
variable "description" { type = string }
variable "schedule" { type = string }
variable "timezone" { type = string }
variable "topic_id" {}


# ---- Labels -----------------00000------------------------------
variable "project" {
  type        = string
  description = "label for deployment"
}


# ---- Infrastructure --------------------------------------------


resource "google_cloud_scheduler_job" "trigger" {
  name        = "shed"
  description = var.description
  schedule    = var.schedule
  time_zone   = var.timezone

  pubsub_target {
    topic_name = var.topic_id
    data       = base64encode("{}")
  }
}

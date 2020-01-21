# Terraform Requirements
terraform {
  required_version = ">= 0.12"
}

# ---- Variables -------------------------------------------------
variable "name" {
  type = string
}

# ---- Labels ----------------------------------------------------
variable "project" {
  type        = string
  description = "label for deployment"
}

# ---- Infrastructure --------------------------------------------
resource "google_pubsub_topic" "default" {
  name   = var.name
  labels = { project = lower(var.project) }
}

# ---- Outputs ---------------------------------------------------
output "name" {
  value = google_pubsub_topic.default.name
}

output "id" {
  value = google_pubsub_topic.default.id
}

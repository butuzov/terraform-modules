# Variables
variable "name" {
  type = string
}

variable "description" {
  type = string
}

variable "path_from" {
  type = string
}
variable "path_to" {
  type = string
}

variable "bucket" {
  type = string
}

# Functions Settings

# Avaialbe memory defaults to lowest value
variable "handler" {
  type = string
}

variable "memory" {
  default = 128
}

variable "timeout" {
  default = 20
}

variable "max_instances" {
  default = 1
}

variable "runtime" {
  type    = string
  default = "python37"
}


# trigger pubsub

variable "topic" {
  type = string
}

# env
variable "ENV_VARS" {
  type    = map
  default = {}
}


# ---- Labels ----------------------------------------------------
variable "project" {
  type        = string
  description = "label for deployment"
}

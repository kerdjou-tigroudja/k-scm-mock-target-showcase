variable "project_id" {
  description = "GCP project ID. Required, with no default, so apply cannot target a project unless one is passed explicitly."
  type        = string
  nullable    = false
}

variable "region" {
  description = "The GCP region"
  type        = string
  default     = "europe-west9"
}

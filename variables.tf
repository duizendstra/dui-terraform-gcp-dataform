variable "project_id" {
  description = "The ID of the GCP project"
  type        = string
}

variable "project_number" {
  description = "The ID of the GCP project"
  type        = string
}

variable "region" {
  description = "The region where Cloud Run service will be deployed"
  type        = string
  default     = "europe-west1"
}

# variable "service_account_email" {
#   description = "The main service account"
#   type        = string
# }

variable "dataform_repository_name" {
  description = "The name of the dataform repository"
  type        = string
}

variable "github_repository_url" {
  description = "The name of the dataform repository"
  type        = string
}

variable "github_default_branch" {
  description = "The name of the dataform repository"
  type        = string
  default     = "main"
}

variable "github_secret_version" {
  description = "The main github secret version"
  type        = string
}

variable "github_secret_id" {
  description = "The main github secret version"
  type        = string
}
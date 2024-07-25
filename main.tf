terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.38.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 5.38.0"
    }
  }
}

resource "google_dataform_repository" "dataform_repository" {
  provider = google-beta

  project         = var.project_id
  name            = var.dataform_repository_name
  display_name    = var.dataform_repository_name
  region          = var.region

  git_remote_settings {
    url                                 = var.github_repository_url
    default_branch                      = var.github_default_branch
    authentication_token_secret_version = var.github_secret_version
  }

  workspace_compilation_overrides {
    default_database = var.project_id
    schema_suffix    = "$${workspaceName}"
    table_prefix     = "$${workspaceName}"
  }
}

// TODO add the option to add multiple releases
resource "google_dataform_repository_release_config" "release" {
  provider = google-beta

  project    = var.project_id
  region     = var.region
  repository = var.dataform_repository_name

  name          = "prod"
  git_commitish = "main"
  depends_on    = [google_dataform_repository.dataform_repository]
}


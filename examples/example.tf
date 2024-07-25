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

module "dataform" {
  source                   = "./.."
  project_id               = "your-project-id"
  project_number           = "your-project-number"
  dataform_repository_name = "your-dataform-repository"
  github_repository_url    = "https://github.com/your-org/your-repo"
  github_default_branch    = "main"
  github_secret_version    = "projects/your-project-number/secrets/your-secret-id/versions/1"
  github_secret_id         = "your-secret-id"
}

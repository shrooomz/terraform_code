terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
  token = ""
}

resource "github_repository" "terraform_test" {
  name        = "terraform_test"
  description = "Created via terraform"
  visibility = "public"
}
terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "~> 1.1"
    }
  }
}

resource "azuredevops_project" "this" {
  name               = var.project.name
  version_control    = "Git"
  work_item_template = "Basic"
  features = {
    boards       = var.project.project_features.boards
    repositories = var.project.project_features.repositories
    pipelines    = var.project.project_features.pipelines
    testplans    = var.project.project_features.testplans
    artifacts    = var.project.project_features.artifacts
  }
}

resource "azuredevops_project_pipeline_settings" "this" {
  project_id                           = azuredevops_project.this.id
  enforce_job_scope                    = var.project.pipeline_settings.enforce_job_scope
  enforce_job_scope_for_release        = var.project.pipeline_settings.enforce_job_scope
  enforce_referenced_repo_scoped_token = var.project.pipeline_settings.enforce_job_scope_for_release
  enforce_settable_var                 = var.project.pipeline_settings.enforce_referenced_repo_scoped_token
  publish_pipeline_metadata            = var.project.pipeline_settings.enforce_settable_var
  status_badges_are_private            = var.project.pipeline_settings.status_badges_are_private

}

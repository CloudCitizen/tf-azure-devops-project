variable "project" {
  type = object({
    name = string
    project_features = object({
      boards       = string
      repositories = string
      pipelines    = string
      testplans    = string
      artifacts    = string
    })
    pipeline_settings = object({
      enforce_job_scope                    = bool
      enforce_job_scope_for_release        = bool
      enforce_referenced_repo_scoped_token = bool
      enforce_settable_var                 = bool
      publish_pipeline_metadata            = bool
      status_badges_are_private            = bool
    })
    policies = object({
      author_email_pattern = object({
        pattern  = list(string)
        enabled  = bool
        blocking = bool
      })
      case_enforcement = object({
        blocking                = bool
        enabled                 = bool
        enforce_consistent_case = bool
      })
      file_path_pattern = object({
        enabled  = bool
        blocking = bool
        pattern  = list(string)
      })
      max_file_size = object({
        enabled  = bool
        blocking = bool
        max_size = number
      })
      max_path_length = object({
        max_length = number
        blocking   = bool
        enabled    = bool
      })
      reserved_names = object({
        blocking = bool
        enabled  = bool
      })
    })
  })
  description = "This object represents the definition of an Azure DevOps organization within Schiphol."

  validation {
    condition = can(
      contains(["enabled", "disabled"], var.project.project_features.boards) &&
      contains(["enabled", "disabled"], var.project.project_features.repositories) &&
      contains(["enabled", "disabled"], var.project.project_features.pipelines) &&
      contains(["enabled", "disabled"], var.project.project_features.testplans) &&
      contains(["enabled", "disabled"], var.project.project_features.artifacts)
    )
    error_message = "Each project feature must be either 'enabled' or 'disabled'."
  }
}

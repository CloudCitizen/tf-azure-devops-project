resource "azuredevops_repository_policy_author_email_pattern" "this" {
  project_id            = azuredevops_project.this.id
  enabled               = var.project.policies.author_email_pattern.enabled
  blocking              = var.project.policies.author_email_pattern.blocking
  author_email_patterns = var.project.policies.author_email_pattern.pattern
}

resource "azuredevops_repository_policy_case_enforcement" "this" {
  project_id              = azuredevops_project.this.id
  enabled                 = var.project.policies.case_enforcement.enabled
  blocking                = var.project.policies.case_enforcement.blocking
  enforce_consistent_case = var.project.policies.case_enforcement.enforce_consistent_case
}

# resource "azuredevops_repository_policy_check_credentials" "this" {
#   project_id = azuredevops_project.this.id
#   enabled    = var.project.policies.check_credentials_enabled
#   blocking   = var.project.policies.check_credentials_blocking
# }

resource "azuredevops_repository_policy_file_path_pattern" "this" {
  project_id        = azuredevops_project.this.id
  enabled           = var.project.policies.file_path_pattern.enabled
  blocking          = var.project.policies.file_path_pattern.blocking
  filepath_patterns = var.project.policies.file_path_pattern.pattern
}

resource "azuredevops_repository_policy_max_file_size" "this" {
  project_id    = azuredevops_project.this.id
  enabled       = var.project.policies.max_file_size.enabled
  blocking      = var.project.policies.max_file_size.blocking
  max_file_size = var.project.policies.max_file_size.max_size
}

resource "azuredevops_repository_policy_max_path_length" "this" {
  project_id      = azuredevops_project.this.id
  enabled         = var.project.policies.max_path_length.enabled
  blocking        = var.project.policies.max_path_length.blocking
  max_path_length = var.project.policies.max_path_length.max_length
}

resource "azuredevops_repository_policy_reserved_names" "this" {
  project_id = azuredevops_project.this.id
  enabled    = var.project.policies.reserved_names.enabled
  blocking   = var.project.policies.reserved_names.blocking
}

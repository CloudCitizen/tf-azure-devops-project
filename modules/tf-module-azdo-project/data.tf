data "azuredevops_groups" "this" {
  project_id = azuredevops_project.this.id
}

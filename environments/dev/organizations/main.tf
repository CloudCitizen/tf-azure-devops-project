terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "~> 1.1"
    }
  }
}

module "azuredevops_project" {
  for_each = local.config
  source   = "../../../modules/tf-module-azdo-project"
  project  = each.value
}

# data "azuredevops_project" "example" {
#   name = "Cloud Citizens"
# }

output "debug" {
  value = module.azuredevops_project["Cloud Citizens"].project_groups
}

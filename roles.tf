##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

locals {
  project_roles_map = { for role in var.roles : role.name_prefix => role if try(role.org, false) != true }
  org_roles_map     = { for role in var.roles : role.name_prefix => role if try(role.org, false) == true }
}

resource "google_project_iam_custom_role" "project_role" {
  for_each    = local.project_roles_map
  role_id     = format("%s_%s", each.value.name_prefix, replace(local.sa_suffix, "-", "_"))
  title       = try(each.value.title, each.value.name_prefix)
  description = try(each.value.description, "Custom Role for ${each.value.name_prefix}")
  permissions = each.value.permissions
}
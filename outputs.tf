##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

output "service_accounts" {
  value = {
    for sa_key, sa in local.sa_map : sa_key => {
      email        = google_service_account.sa[sa_key].email
      unique_id    = google_service_account.sa[sa_key].unique_id
      display_name = google_service_account.sa[sa_key].display_name
      description  = google_service_account.sa[sa_key].description
    }
  }
}

output "roles" {
  value = {
    for role_key, role in local.project_roles_map : role_key => {
      name        = google_project_iam_custom_role.project_role[role_key].name
      title       = google_project_iam_custom_role.project_role[role_key].title
      description = google_project_iam_custom_role.project_role[role_key].description
    }
  }
}
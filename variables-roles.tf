##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

## Roles Definition - YAML Spec
#
# roles:
#   - name_prefix: "custom_role"            # Required
#     title: "Service Account"                  # Optional
#     description: "This is a service account"  # Optional
#     permissions:                              # Required
#       - "iam.serviceAccounts.actAs"
#       - ... etc
variable "roles" {
  description = "GCP Roles to create"
  type        = any
  default     = []
}

## Service Accounts Definition - YAML Spec
#
# service_accounts:
#   - name_prefix: "svc_account"                # Required
#     display_name: "Custom Role"           # Optional
#     description: "This is a custom role"  # Optional
#     policy:                              # Optional
#       - role: roles/iam.serviceAccountUser
#         members:
#           - user:xxxxxx@example.com
#       - ... etc
#     bindings:                              # Optional
#       - role: roles/iam.serviceAccountUser
#         members:
#           - user:xxxxxx@example.com
#         condition:
#           title: "expirable access"
#           description: "optional description"
#           expression: request.time < timestamp("2020-01-01T00:00:00Z")
#     members:                               # Optional
#       - member: user:xxxxxx@example.com
#         role: roles/iam.serviceAccountUser
#         condition:
#           title: "expirable access"
#           description: "optional description"
#           expression: request.time < timestamp("2020-01-01T00:00:00Z")
#     roles:
#       - role: roles/custom_role
#         member: serviceAccount:custom_service_account@example....
#         condition:
#           title: "expirable access"
#           description: "optional description"
#           expression: request.time < timestamp("2020-01-01T00:00:00Z")
variable "service_accounts" {
  description = "GCP Service Accounts to create"
  type        = any
  default     = []
}
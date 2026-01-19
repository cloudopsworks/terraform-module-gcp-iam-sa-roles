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
#   - name_prefix: "custom_role"            # (Required) The name prefix of the custom role.
#     title: "Service Account"             # (Optional) The title of the custom role. Default: name_prefix
#     description: "This is a role"        # (Optional) A description of the custom role. Default: "Custom Role for {name_prefix}"
#     org: false                           # (Optional) If true, create an organization-level role. Default: false
#     env_suffix: false                    # (Optional) If true, append environment suffix to the role ID. Default: false
#     permissions:                         # (Required) The list of permissions for the custom role.
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
#   - name_prefix: "svc_account"           # (Required) The name prefix of the service account.
#     display_name: "Custom SA"            # (Optional) The display name of the service account. Default: name_prefix
#     description: "This is a SA"          # (Optional) A description of the service account. Default: "Service Account for {name_prefix}"
#     env_suffix: false                    # (Optional) If true, append environment suffix to the account ID. Default: false
#     policy:                              # (Optional) IAM Policy binding to apply to the service account (authoritative).
#       - role: roles/iam.serviceAccountUser # (Required) The role to bind.
#         members:                         # (Required) The list of members to bind the role to.
#           - user:xxxxxx@example.com
#         condition:                       # (Optional) IAM Condition for the binding.
#           title: "expirable access"      # (Required) The title of the condition.
#           description: "description"     # (Optional) A description for the condition.
#           expression: "..."              # (Required) The CEL expression for the condition.
#     bindings:                            # (Optional) IAM Binding to apply to the service account (authoritative for the role).
#       - role: roles/iam.serviceAccountUser # (Required) The role to bind.
#         members:                         # (Required) The list of members to bind the role to.
#           - user:xxxxxx@example.com
#         condition:                       # (Optional) IAM Condition for the binding.
#           title: "expirable access"      # (Required) The title of the condition.
#           description: "description"     # (Optional) A description for the condition.
#           expression: "..."              # (Required) The CEL expression for the condition.
#     members:                             # (Optional) IAM Member to apply to the service account (non-authoritative).
#       - member: user:xxxxxx@example.com  # (Required) The member to bind.
#         role: roles/iam.serviceAccountUser # (Required) The role to bind.
#         condition:                       # (Optional) IAM Condition for the member.
#           title: "expirable access"
#           description: "description"
#           expression: "..."
#     roles:                               # (Optional) Project-level IAM roles to assign to the service account.
#       - role: roles/viewer               # (Optional) The GCP role to assign. Either role or ref is required.
#         ref: "custom_role_prefix"        # (Optional) Reference to a custom role created in the 'roles' variable.
#         condition:                       # (Optional) IAM Condition for the project role assignment.
#           title: "expirable access"
#           description: "description"
#           expression: "..."
variable "service_accounts" {
  description = "GCP Service Accounts to create"
  type        = any
  default     = []
}
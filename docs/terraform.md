## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 7.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | ~> 7.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 7.8.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_tags"></a> [tags](#module\_tags) | cloudopsworks/tags/local | 1.0.9 |

## Resources

| Name | Type |
|------|------|
| [google_project_iam_custom_role.project_role](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_custom_role) | resource |
| [google_project_iam_member.role_member](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.role_member_ref](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_account.sa](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account_iam_binding.sa_iam_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_iam_binding) | resource |
| [google_service_account_iam_member.sa_iam_member](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_iam_member) | resource |
| [google_service_account_iam_policy.sa_iam_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_iam_policy) | resource |
| [google_iam_policy.sa_iam_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/iam_policy) | data source |
| [google_project.current](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | Extra tags to add to the resources | `map(string)` | `{}` | no |
| <a name="input_is_hub"></a> [is\_hub](#input\_is\_hub) | Is this a hub or spoke configuration? | `bool` | `false` | no |
| <a name="input_org"></a> [org](#input\_org) | Organization details | <pre>object({<br/>    organization_name = string<br/>    organization_unit = string<br/>    environment_type  = string<br/>    environment_name  = string<br/>  })</pre> | n/a | yes |
| <a name="input_roles"></a> [roles](#input\_roles) | GCP Roles to create | `any` | `[]` | no |
| <a name="input_service_accounts"></a> [service\_accounts](#input\_service\_accounts) | GCP Service Accounts to create | `any` | `[]` | no |
| <a name="input_spoke_def"></a> [spoke\_def](#input\_spoke\_def) | Spoke ID Number, must be a 3 digit number | `string` | `"001"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_roles"></a> [roles](#output\_roles) | n/a |
| <a name="output_service_accounts"></a> [service\_accounts](#output\_service\_accounts) | n/a |

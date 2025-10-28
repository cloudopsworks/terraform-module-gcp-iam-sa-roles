##
# (c) 2021-2025
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

locals {
  sa_map = { for sa in var.service_accounts : sa.name_prefix => sa }
}

resource "google_service_account" "sa" {
  for_each     = local.sa_map
  account_id   = format("%s-%s", each.value.name_prefix, local.system_name_short)
  display_name = try(each.value.display_name, each.value.name_prefix)
  description  = try(each.value.description, "Service Account for ${each.value.name_prefix}")
}

data "google_iam_policy" "sa_iam_policy" {
  for_each = {
    for k, sa in local.sa_map : k => sa if length(try(sa.policy, [])) > 0
  }
  dynamic "binding" {
    for_each = try(each.value.policy, {})
    content {
      role    = binding.value.role
      members = binding.value.members
      dynamic "condition" {
        for_each = length(try(binding.value.condition, {})) > 0 ? [1] : []
        content {
          title       = binding.value.condition.title
          description = try(binding.value.condition.description, "")
          expression  = binding.value.condition.expression
        }
      }
    }
  }
}

resource "google_service_account_iam_policy" "sa_iam_policy" {
  for_each           = local.sa_map
  service_account_id = google_service_account.sa[each.key].id
  policy_data        = data.google_iam_policy.sa_iam_policy[each.key].policy_data
}

resource "google_service_account_iam_binding" "sa_iam_binding" {
  for_each = merge([
    for sa in local.sa_map : {
      for binding in try(sa.bindings, []) : "${sa.name_prefix}~${binding.role}" => {
        sa_prefix = sa.name_prefix
        binding   = binding
      }
    }
  ])
  service_account_id = google_service_account.sa[each.value.sa_prefix].id
  role               = each.value.binding.role
  members            = each.value.binding.members
  dynamic "condition" {
    for_each = length(try(each.value.binding.condition, {})) > 0 ? [1] : []
    content {
      title       = each.value.binding.condition.title
      description = try(each.value.binding.condition.description, "")
      expression  = each.value.binding.condition.expression
    }
  }
}

resource "google_service_account_iam_member" "sa_iam_member" {
  for_each = merge([
    for sa in local.sa_map : {
      for member in try(sa.members, []) : "${sa.name_prefix}~${replace(member, ":", "~")}" => {
        sa_prefix = sa.name_prefix
        member    = member
      }
    }
  ])
  service_account_id = google_service_account.sa[each.value.sa_prefix].id
  member             = each.value.member.member
  role               = each.value.member.role
  dynamic "condition" {
    for_each = length(try(each.value.member.condition, {})) > 0 ? [1] : []
    content {
      title       = each.value.member.condition.title
      description = try(each.value.member.condition.description, "")
      expression  = each.value.member.condition.expression
    }
  }
}
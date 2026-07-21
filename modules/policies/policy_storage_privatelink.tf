# Look up built-in Storage Private Link policy
data "azurerm_policy_definition" "storage_private_link" {
  display_name = "Storage accounts should use private link (excluding storage accounts created by Databricks)"
}

# Assign to Subscription
resource "azurerm_subscription_policy_assignment" "storage_private_link" {
  name                 = "assign-storage-private-link"
  display_name         = "Require Private Link for Storage Accounts"
  subscription_id      = "/subscriptions/${var.target_subscription_id}"
  policy_definition_id = data.azurerm_policy_definition.storage_private_link.id
  description          = "Audits storage accounts that do not utilize private endpoint connections."
}
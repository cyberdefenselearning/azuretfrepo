# Look up built-in Key Vault RBAC policy
data "azurerm_policy_definition" "kv_rbac" {
  display_name = "Azure Key Vault should use RBAC permission model"
}

# Assign to Subscription
resource "azurerm_subscription_policy_assignment" "kv_rbac" {
  name                 = "assign-kv-rbac"
  display_name         = "Enforce Key Vault RBAC Permission Model"
  subscription_id      = "/subscriptions/${var.target_subscription_id}"
  policy_definition_id = data.azurerm_policy_definition.kv_rbac.id
  description          = "Ensures that Azure Key Vaults use Azure RBAC for fine-grained access control."
}
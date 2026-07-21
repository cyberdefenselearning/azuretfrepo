variable "target_subscription_id" {
  type = string
}

# Look up test built-in policy definition
data "azurerm_policy_definition" "kv_rbac" {
  display_name = "Azure Key Vault should use RBAC permission model"
}

# Assign test policy to subscription
resource "azurerm_subscription_policy_assignment" "test_kv_rbac" {
  name                 = "assign-test-kv-rbac"
  display_name         = "Test Policy - Azure Key Vault RBAC"
  subscription_id      = "/subscriptions/${var.target_subscription_id}"
  policy_definition_id = data.azurerm_policy_definition.kv_rbac.id
}
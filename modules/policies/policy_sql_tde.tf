# Look up built-in SQL TDE policy
data "azurerm_policy_definition" "sql_tde" {
  display_name = "Transparent Data Encryption on SQL databases should be enabled"
}

# Assign to Subscription
resource "azurerm_subscription_policy_assignment" "sql_tde" {
  name                 = "assign-sql-tde"
  display_name         = "Audit Transparent Data Encryption on SQL"
  subscription_id      = "/subscriptions/${var.target_subscription_id}"
  policy_definition_id = data.azurerm_policy_definition.sql_tde.id
  description          = "Audits SQL databases to ensure TDE is enabled."
}
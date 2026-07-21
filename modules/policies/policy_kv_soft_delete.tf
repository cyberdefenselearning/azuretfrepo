# ==============================================================================
# POLICY: Key Vault Soft Delete Enabled (Audit)
# ==============================================================================

data "azurerm_policy_definition" "kv_soft_delete" {
  display_name = "Key vaults should have soft delete enabled"
}

resource "azurerm_subscription_policy_assignment" "kv_soft_delete" {
  name                 = "assign-kv-soft-delete"
  display_name         = "Audit Key Vault Soft Delete Status"
  subscription_id      = "/subscriptions/${var.target_subscription_id}"
  policy_definition_id = data.azurerm_policy_definition.kv_soft_delete.id
  description          = "Audits whether Key Vaults have soft delete enabled to protect against accidental deletion."

  parameters = jsonencode({
    effect = {
      value = "Audit"
    }
  })
}
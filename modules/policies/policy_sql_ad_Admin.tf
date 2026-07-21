# ==============================================================================
# POLICY: Azure AD Admin on SQL Servers (AuditIfNotExists)
# ==============================================================================

data "azurerm_policy_definition" "sql_ad_admin" {
  display_name = "An Azure Active Directory administrator should be provisioned for SQL servers"
}

resource "azurerm_subscription_policy_assignment" "sql_ad_admin" {
  name                 = "assign-sql-ad-admin"
  display_name         = "Audit Microsoft Entra Admin Provisioning on SQL Servers"
  subscription_id      = "/subscriptions/${var.target_subscription_id}"
  policy_definition_id = data.azurerm_policy_definition.sql_ad_admin.id
  description          = "Audits provisioning of a Microsoft Entra ID administrator for Azure SQL servers."

  parameters = jsonencode({
    effect = {
      value = "AuditIfNotExists"
    }
  })
}
# ==============================================================================
# POLICY: APIM Platform Version stv2 (Audit)
# ==============================================================================

data "azurerm_policy_definition" "apim_stv2" {
  display_name = "Azure API Management platform version should be stv2"
}

resource "azurerm_subscription_policy_assignment" "apim_stv2" {
  name                 = "assign-apim-stv2"
  display_name         = "Audit API Management Platform Version stv2"
  subscription_id      = "/subscriptions/${var.target_subscription_id}"
  policy_definition_id = data.azurerm_policy_definition.apim_stv2.id
  description          = "Audits Azure API Management instances to ensure they are using the stv2 platform compute engine."

  parameters = jsonencode({
    effect = {
      value = "Audit"
    }
  })
}
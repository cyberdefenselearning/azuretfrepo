# Look up built-in App Service Client Certificates policy
data "azurerm_policy_definition" "appservice_certs" {
  display_name = "App Service apps should have Client Certificates (Incoming client certificates) enabled"
}

# Assign to Subscription
resource "azurerm_subscription_policy_assignment" "appservice_certs" {
  name                 = "assign-appservice-certs"
  display_name         = "Require Incoming Client Certificates on App Service"
  subscription_id      = "/subscriptions/${var.target_subscription_id}"
  policy_definition_id = data.azurerm_policy_definition.appservice_certs.id
}
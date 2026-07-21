# Call the policies module
module "policies" {
  source                 = "./modules/policies"
  target_subscription_id = var.target_subscription_id
}
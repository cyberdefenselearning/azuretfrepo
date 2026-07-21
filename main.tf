variable "target_subscription_id" {
  type        = string
  description = "Target Azure Subscription ID"
}

# 1. Test Policy Module (Running Now)
module "policies" {
  source                 = "./modules/policies"
  target_subscription_id = var.target_subscription_id
}

# 2. Future Resources (Uncomment as you build them later!)
# module "networking" {
#   source = "./modules/networking"
# }
# module "keyvault" {
#   source = "./modules/keyvault"
# }
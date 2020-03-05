module "network" {
  source      = "../"
  environment = "production"
  location    = "West US"
  resourcegroup_name = "microsoft_csa_test"
}
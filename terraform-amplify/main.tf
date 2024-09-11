// This is a template file for a basic deployment.
// Modify the parameters below with actual values
module "amplify-app" {
  source = "./modules/amplify-app-module"
  path_to_build_spec = "../amplify.yml"

}

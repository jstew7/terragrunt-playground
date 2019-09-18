include {
  path = find_in_parent_folders()
}

terraform {
  source = "${local.path}/module_a"
}

locals {
  common_vars = yamldecode(file("${get_terragrunt_dir()}/${find_in_parent_folders("common_vars.yaml")}"))
  path        = get_env("MODULE_PATH", "bad_path")
}

inputs = {
  port = local.common_vars.port
}

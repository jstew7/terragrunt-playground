include {
  path = find_in_parent_folders()
}

terraform {
  source = "${local.path}/module_a"
}

locals {
  path = get_env("MODULE_PATH", "bad_path")
}

dependency "a_1" {
  config_path = "../a_1"

  mock_outputs = {
    port = 1234
  }
}

inputs = {
  port = dependency.a_1.outputs.port
}

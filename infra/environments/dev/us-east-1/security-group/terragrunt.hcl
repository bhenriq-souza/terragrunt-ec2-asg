terraform {
  source = "github.com/terraform-aws-modules/terraform-aws-security-group//modules/http-80"
}

include {
  path = find_in_parent_folders()
}

locals { 
  env_vars = yamldecode(file(find_in_parent_folders("env.yaml")))
}

dependency "vpc" {
  config_path = find_in_parent_folders()

  mock_inputs = {
    vpc_id = "vpc-00000000"
  }
}

inputs = {
  name = ""
}
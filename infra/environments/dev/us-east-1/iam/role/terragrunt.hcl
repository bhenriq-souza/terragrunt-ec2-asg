terraform {
  source = "github.com/terraform-aws-modules/terraform-aws-iam//modules/iam-assumable-role"
}

include {
  path = find_in_parent_folder()
}

locals {
  env_vars = yamldecode(file(find_in_parent_folder("env.yaml")))
}

inputs = {
  create_role             = true
  create_instance_profile = true
  role_name               = "bubbeserver-${local.env_vars.env}"
  trusted_role_services   = [
    "ec2.amazonaws.com"
  ]
  custom_role_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  ]
}

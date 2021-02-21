locals {
    environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
    env = local.environment_vars.locals.environment 
}

terraform {
    // source = "git::https://github.com/dev-minds/tf_modules.git//fm_s3_mod?ref=master"
    source = "git::https://github.com/dev-minds/tf_modules.git//fm_vpc_mod/dm_simple_vpc?ref=master"
}

include {
    path = find_in_parent_folders()
}

inputs = {
    ip_range        = "10.10.0.0/16"
    name_tag        = "management"

    dns_support     = "true"
    dns_hostn       = "true"

    pub_ip_range    = ["10.10.5.0/24", "10.10.6.0/24", "10.10.7.0/24"]
    pub_azs         = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]

    priv_ip_range    = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
    priv_azs         = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]

    enabled_nat_gateway = "false"
    enabled_single_nat_gateway = "false"
}
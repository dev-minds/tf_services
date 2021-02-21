locals {
    environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
    env = local.environment_vars.locals.environment 
}

terraform {
    source = "git::https://github.com/dev-minds/tf_modules.git//fm_ec2_mod?ref=master"
}

include {
    path = find_in_parent_folders()
}

dependency "vpc" {
    config_path = "../tf_vpc_svc"
}

inputs = {
    vpc_id = dependency.vpc.outputs.vpc_id_otp
    target_subnet = dependency.vpc.outputs.private_subnets[0]
    instance_type = "t2.micro"
    target_keypairs = "centrale-keys"
    billing_code_tag = "12345"
    instance_count = "2"
    ami_name = "Base*"
    env_tag = local.env 
}
locals {
    environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
    env = local.environment_vars.locals.environment 
}

terraform {
    source = "git::https://github.com/dev-minds/tf_modules.git//fm_rbac_mod/iam-groups?ref=master"
}

include {
    path = find_in_parent_folders()
}

inputs = {
    grp_name = "team_paris"
    grp_users = [

    ]
}

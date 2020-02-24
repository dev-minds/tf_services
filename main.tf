
provider "aws" {
  region  = "eu-west-1"
  version = "~> 2.7"
}

terraform {
  required_version = ">= 0.12.12"

  backend "s3" {
    bucket  = "dm-vpc-states"
    key     = "dm_tf_modules/s3_service.tfstates"
    region  = "eu-west-1"
    encrypt = "true"
  }
}

# CALL TARGET MODULE 
module "app_cluster" {
  source = "git::https://github.com/dev-minds/dm_tf_base_modules.git//services/tf_be_dev?ref=v0.0.2"

  aws_region    = "eu-west-1"
  app_inst_type = "t2.micro"
  environment   = "dev"
}
provider "aws" {
  region = "eu-west-1"
}

locals {
  name        = "angular-ecs"
  environment = "dev"

  # This is the convention we use to know what belongs to each other
  ec2_resources_name = "${local.name}-${local.environment}"
}





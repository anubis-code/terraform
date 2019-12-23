module "ecs" {
  source = "../../"
  name   = local.name
}

module "ec2-profile" {
  source = "../../modules/ecs-instance-profile"
  name   = local.name
}

module "hello-world" {
  source     = "./service-angular"
  cluster_id = module.ecs.this_ecs_cluster_id
}

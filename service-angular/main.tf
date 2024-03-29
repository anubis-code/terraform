resource "aws_cloudwatch_log_group" "angular" {
  name              = "angular"
  retention_in_days = 1
}

resource "aws_ecs_task_definition" "angular" {
  family = "angular"

  container_definitions = <<EOF
[
  {
    "name": "angular",
    "image": "my-angular-app",
    "cpu": 0,
    "memory": 128,
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-region": "eu-west-1",
        "awslogs-group": "angular"
      }
    }
  }
]
EOF
}

resource "aws_ecs_service" "angular" {
  name = "angular"
  cluster = var.cluster_id
  task_definition = aws_ecs_task_definition.angular.arn

  desired_count = 1

  deployment_maximum_percent = 100
  deployment_minimum_healthy_percent = 0
}

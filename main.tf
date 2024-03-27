provider "aws" {
  region = var.ap-south-1
}

resource "aws_ecs_cluster" "medusa_cluster" {
  name = "medusa-cluster"
}

resource "aws_ecs_task_definition" "medusa_task" {
  family                   = "medusa-task"
  container_definitions    = <<EOF
    [{
      "name": "medusa-container",
      "image": "${var.docker_image_uri}",
      "cpu": 512,
      "memory": 1024,
      "essential": true,
      "portMappings": [
        {
          "containerPort": ${var.container_port},
          "hostPort": 0,
          "protocol": "tcp"
        }
      ],
      "environment": [
        {
          "name": "NODE_ENV",
          "value": "production"
        }
        # Add other environment variables as needed
      ]
    }]
  EOF
}

resource "aws_ecs_service" "medusa_service" {
  name            = "medusa-service"
  cluster         = aws_ecs_cluster.medusa_cluster.id
  task_definition = aws_ecs_task_definition.medusa_task.arn
  desired_count   = 1

  network_configuration {
    subnets         = var.subnet_ids
    security_groups = [var.security_group_id]
    assign_public_ip = true # Set to false if using a private subnet
  }

  load_balancer {
    target_group_arn = var.alb_target_group_arn
    container_name   = "medusa-container"
    container_port   = var.container_port
  }
}

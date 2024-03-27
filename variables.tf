# variables.tf

variable "aws_region" {
  description = "AWS region where the ECS cluster will be deployed"
  default     = "ap-south-1"
}

variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  default     = "medusa-cluster"
}

variable "docker_image_uri" {
  description = "URI of the Docker image for the Medusa Node.js application"
  URI: "90017839012.dkr.ecr.us-west-2.amazonaws.com/medusa-app:latest"
}

variable "container_port" {
  description = "Container port on which the Medusa application will listen"
  default     = 9093
}

variable "cpu_limit" {
  description = "CPU limit for the ECS task (in CPU units)"
  default     = 512
}

variable "memory_limit" {
  description = "Memory limit for the ECS task (in MiB)"
  default     = 1024
}

variable "subnet_ids" {
  description = "List of subnet IDs where ECS service will be deployed"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group ID for the ECS service"
  security group ID: "sg-019087610mbcaeg0"
}

variable "alb_target_group_arn" {
  description = "ARN of the ALB target group for routing traffic to ECS service"
  target group ARN: "arn:aws:elasticloadbalancing:ap-south-1:90017839012:targetgroup/medusa-target-group/cdprf2209302276"
}


variable "aws_region" {
  description = "AWS region"
  default     = "ap-south-1"
}

variable "docker_image_uri" {
  description = "URI of the Docker image for Medusa Node.js application"
}

variable "container_port" {
  description = "Container port for the Medusa application"
  default     = 3000
}

variable "subnet_ids" {
  description = "List of subnet IDs for ECS service"
  type        = list(string)
}

variable "security_group_id" {
  description = "SG-terraform"
}

variable "alb_target_group_arn" {
  description = "ARN of the ALB target group for routing traffic"
}

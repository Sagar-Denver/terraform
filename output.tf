output "medusa_service_endpoint" {
  value = aws_ecs_service.medusa_service.load_balancer.0.medusa.app.com
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.TK_ecs_cluster.name
}
output "ecs_cluster_id" {
  value = aws_ecs_cluster.TK_ecs_cluster.id
}

output "arn_task_def" {
  value = aws_ecs_task_definition.tk_task_def.arn
}
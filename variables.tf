variable "ecs_cluster_name" {
  type = string
}
variable "ami_id" {
  type    = string
  default = "ami-050cd642fd83388e4"
}
variable "instance_type" {
  type = string
}
variable "az" {
  type = string

}
variable "tg_arn" {
  type = string
}
variable "ecs_cluster_id" {
  type = string
}
variable "ecsTaskExecutionRole" {
  type = string
}

variable "sg-ecs-id" {
  type = string
}

variable "container_cpu" {
  type = number
}
variable "container_image" {
  type = string
}
variable "container_memory" {
  type = number
}
variable "container_name" {
  type = string
}
variable "task_cpu" {
  type = number
}
variable "task_family" {
  type = string
}
variable "task_memory" {
  type = number
}
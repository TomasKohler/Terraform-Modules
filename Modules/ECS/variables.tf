variable "private_subnet_1" {
  type = string
  description = "subnet privada1"
}
variable "private_subnet_2" {
  type = string
  description = "subnet privada2"
}


variable "ami_id" {
    type = string
    description = "ami id for instances"
  
}
variable "instance_type" {
    type = string
    description = "instance type"
  
}
variable "ecsTaskExecutionRole" {
  type = string
  description = "role for task execution"
}
variable "az" {
  description = "availability zone"
    type = string
  
}
variable "sg-ecs-id" {
  description = "id for the sg"
    type = string
}
variable "ecs_cluster_name" {
  type = string
}
variable "ecs_cluster_id" {
  type = string
}
variable "tg_arn" {
  type = string
  
}
variable "task_family" {
  description = "family for task def"
  type = string
}
variable "task_cpu" {
  description = "tasks cpu"
  type = number
}
variable "task_memory" {
  type = number
  description = "memory for task"
}

variable "container_name" {
  type = string  
}
variable "container_image" {
  type = string  
}
variable "container_cpu" {
  type = number  
}
variable "container_memory" {
  type = number  
}
variable "iam_inst_profile_arn" {
 type= string 
}

variable "ami_id" {
  type    = string
  default = "ami-050cd642fd83388e4"
}
variable "instance_type" {
  type = string
}
variable "az" {
  type    = string
  default = ""

}


variable "ecsTaskExecutionRole" {
  type = string
}

variable "container_definitions" {
  type = list(object({
    name      = string
    image     = string
    cpu       = number
    memory    = number
    essential = bool
    portMapping = list(object({
      container_port = number
      hostPort       = number
    }))
  }))
}



# variable "container_cpu" {
#   type = number
# }
# variable "container_image" {
#   type = string
# }
# variable "container_memory" {
#   type = number
# }
# variable "container_name" {
#   type = string
# }
variable "task_cpu" {
  type = number
}
variable "task_family" {
  type = string
}
variable "task_memory" {
  type = number
}
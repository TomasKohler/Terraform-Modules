variable "HTTP_Port-80" {
  type = list(object({
    internal    = number
    external    = number
    protocol    = string
    cidr_blocks = string
  }))
  default = [
    {
      internal    = 80
      external    = 80
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}

variable "HTTPS_Port-443" {
  type = list(object({
    internal    = number
    external    = number
    protocol    = string
    cidr_blocks = string
  }))
  default = [
    {
      internal    = 443
      external    = 443
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}

variable "HTTPS_Port-443-egress" {
  type = list(object({
    internal    = number
    external    = number
    protocol    = string
    cidr_blocks = string
  }))
  default = [
    {
      internal    = 0
      external    = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}



variable "vpc_id" {
  description = "id de la vpc"
  type        = string
}

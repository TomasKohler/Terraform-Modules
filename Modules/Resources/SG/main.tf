
#SG for LB instances

resource "aws_security_group" "SG-TK-LB" {
name        = "TK_SG_lb"
description = "security group  in terraform"
vpc_id = var.vpc_id

tags = {
    Name    = "TK_SG_lb"
    Owner   = "Tomas Köhler"
    Project = "Internship Program"
}
ingress {
    from_port   = var.HTTP_Port-80[0].internal
    protocol    = var.HTTP_Port-80[0].protocol
    to_port     = var.HTTP_Port-80[0].external
    cidr_blocks = [var.HTTP_Port-80[0].cidr_blocks]
}
ingress {
    from_port   = var.HTTPS_Port-443[0].internal
    protocol    = var.HTTPS_Port-443[0].protocol
    to_port     = var.HTTPS_Port-443[0].external
    cidr_blocks = [var.HTTPS_Port-443[0].cidr_blocks]
}
egress  {
    from_port   = var.HTTPS_Port-443-egress[0].internal
    protocol    = var.HTTPS_Port-443-egress[0].protocol
    to_port     = var.HTTPS_Port-443-egress[0].external
    cidr_blocks = [var.HTTPS_Port-443-egress[0].cidr_blocks]
}
}


#SG for instances

resource "aws_security_group" "SG-TK-ECS" {
name        = "TK_SG_ecs"
description = "security group  for ecs in terraform"
vpc_id = var.vpc_id

tags = {
    Name    = "TK_SG_ecs"
    Owner   = "Tomas Köhler"
    Project = "Internship Program"
}
ingress {
    from_port   = var.HTTP_Port-80[0].internal
    protocol    = var.HTTP_Port-80[0].protocol
    to_port     = var.HTTP_Port-80[0].external
    security_groups = [aws_security_group.SG-TK-LB.id]
}
ingress {
    from_port   = var.HTTPS_Port-443[0].internal
    protocol    = var.HTTPS_Port-443[0].protocol
    to_port     = var.HTTPS_Port-443[0].external
    security_groups = [aws_security_group.SG-TK-LB.id]
}
egress  {
    from_port   = var.HTTPS_Port-443-egress[0].internal
    protocol    = var.HTTPS_Port-443-egress[0].protocol
    to_port     = var.HTTPS_Port-443-egress[0].external
    cidr_blocks = [var.HTTPS_Port-443-egress[0].cidr_blocks]
}
}
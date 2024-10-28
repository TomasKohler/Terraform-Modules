data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-ecs-hvm-*-x86_64-ebs"]
  }
}

resource "aws_ecs_cluster" "TK_ecs_cluster" {
  name = "TK-cluster"
}



## esto es para el cluster

resource "aws_ecs_service" "TK_ecs_service" {
  name          = "TK_ecs_service"
  cluster       = aws_ecs_cluster.TK_ecs_cluster.id
  desired_count = 1
  launch_type   = "EC2"
  load_balancer {
    target_group_arn = var.tg_arn
    container_name   = "tk-php"
    container_port   = 80
  }
}
resource "aws_ecs_cluster_capacity_providers" "example" {
  cluster_name = aws_ecs_cluster.TK_ecs_cluster.name

  capacity_providers = [aws_ecs_capacity_provider.tk_cap_prov.name]

}

resource "aws_ecs_capacity_provider" "tk_cap_prov" {

  name = "tk_ecs_cap_prov"
  auto_scaling_group_provider {
    auto_scaling_group_arn         = aws_autoscaling_group.TK_ecs_ASG.arn
    managed_termination_protection = "DISABLED"
    managed_scaling {
      maximum_scaling_step_size = 2
      minimum_scaling_step_size = 1
      status                    = "ENABLED"
      target_capacity           = 1
    }
  }
}


resource "aws_ecs_task_definition" "tk_task_def" {
  family                   = var.task_family
  execution_role_arn       = "arn:aws:iam::253490770873:role/ECSTaskExecutionRoleLab"
  network_mode             = "bridge"
  requires_compatibilities = ["EC2"]
  cpu                      = var.task_cpu
  memory                   = var.task_memory


  container_definitions = jsonencode(var.container_definitions)

}


##fin cluster


#Autoscaling



resource "aws_launch_template" "tk_launch_template" {
  name_prefix   = "tk_launch_template"
  image_id      = data.aws_ami.amazon_linux.image_id
  instance_type = var.instance_type

  iam_instance_profile {
    arn = var.iam_inst_profile_arn
  }
  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [var.sg-ecs-id]
  }
  user_data = filebase64("${path.module}/user_data.sh")
}

resource "aws_autoscaling_group" "TK_ecs_ASG" {
  name                = "TK_ASG"
  max_size            = 1
  min_size            = 1
  desired_capacity    = 1
  vpc_zone_identifier = [var.private_subnet_1, var.private_subnet_2]

  health_check_type         = "EC2"
  health_check_grace_period = 60


  instance_maintenance_policy {
    min_healthy_percentage = 90
    max_healthy_percentage = 120
  }


  launch_template {
    id      = aws_launch_template.tk_launch_template.id
    version = "$Latest"
  }

  tag {
    key                 = "AmazonECSManaged"
    value               = true
    propagate_at_launch = true
  }


}






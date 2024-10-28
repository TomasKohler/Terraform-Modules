module "TK_sg_lb" {
  source = "./Modules/SG"
  vpc_id = data.aws_vpc.internship_vpc.id
}
module "TK-tg" {
  source = "./Modules/TG"
  vpc_id = data.aws_vpc.internship_vpc.id
}
module "TK-alb" {
  source      = "./Modules/ALB"
  vpc_subnet1 = data.aws_subnet.public_subnet_1.id
  vpc_subnet2 = data.aws_subnet.public_subnet_2.id
  sg-ecs-id   = module.TK_sg_lb.SG-LB-id
  vpc_id      = data.aws_vpc.internship_vpc.id
}

module "tk-ecs" {
  source                = "./Modules/ECS"
  ami_id                = var.ami_id
  az                    = var.az
  ecsTaskExecutionRole  = var.ecsTaskExecutionRole
  iam_inst_profile_arn  = "arn:aws:iam::253490770873:instance-profile/ecsInstanceRole"
  instance_type         = var.instance_type
  private_subnet_1      = data.aws_subnet.private_subnet_1.id
  private_subnet_2      = data.aws_subnet.private_subnet_2.id
  sg-ecs-id             = module.TK_sg_lb.SG-LB-id
  task_cpu              = var.task_cpu
  task_family           = var.task_family
  task_memory           = var.task_memory
  tg_arn                = module.TK-tg.TG-arn
  container_definitions = var.container_definitions


}


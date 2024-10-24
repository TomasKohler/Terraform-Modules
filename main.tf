module "TK_sg_lb" {
  source = "./Modules/Resources/SG"
  vpc_id = data.aws_vpc.internship_vpc.id
}
module "TK-tg" {
  source = "./Modules/Resources/TG"  
  vpc_id = data.aws_vpc.internship_vpc.id
}
module "TK-alb" {
  source = "./Modules/Resources/ALB"
  vpc_subnet1 = data.aws_subnet.public_subnet_1.id
  vpc_subnet2 = data.aws_subnet.public_subnet_2.id
  sg-ecs-id = module.TK_sg_lb.SG-LB-id
  vpc_id = data.aws_vpc.internship_vpc.id
}


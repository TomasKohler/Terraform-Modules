
#Load balncer 

resource "aws_lb" "TK-LB" {
  name = "TK-LB"

  load_balancer_type         = "application"
  security_groups            = [var.sg-ecs-id]
  subnets                    = [var.vpc_subnet1, var.vpc_subnet2]
  enable_deletion_protection = false
  internal                   = false

  tags = {
    Name = "TK-LB-terra"

  }
}



resource "aws_lb_listener" "HTTP" {
  load_balancer_arn = aws_lb.TK-LB.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type = "redirect"
    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }

}

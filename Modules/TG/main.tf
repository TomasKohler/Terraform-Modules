
resource "aws_lb_target_group" "alb-TG" {
  name        = "tk-lb-alb-tg"
  target_type = "alb"
  port        = 80
  protocol    = "TCP"
  vpc_id      = var.vpc_id
}
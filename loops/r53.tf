resource "aws_route53_record" "expense" {
    count = 3
  zone_id = var.zone_id
  name    = "${var.instance_name [count.index]}.${var.zone_name}"
  type    = "A"
  ttl   = 1
  records = [aws_instance.expense[count.index].private_ip]
  allow_overwrite = true

}

resource "aws_route53_record" "frontend" {
  zone_id = var.zone_id
  name    = var.zone_name
  type    = "A"
  ttl   = 1
  records = [aws_instance.expense[2].public_ip]
  allow_overwrite = true

}


resource "aws_security_group" "web" {
  name = "Dynamic Security Group"

  dynamic "ingress" {
    for_each = var.Allow_ports_in
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = var.Protocol_in
      cidr_blocks = var.CidrBlock_in
    }
  }
  dynamic "egress" {
    for_each = var.Allow_ports_out
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = var.Protocol_out
      cidr_blocks = var.CidrBlock_out
    }
  }

  tags = {
    Name = "${var.tags_common}-security"
  }
}

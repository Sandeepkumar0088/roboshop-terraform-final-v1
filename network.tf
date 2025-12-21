resource "aws_security_group" "ex2" {
    for_each            = var.components
    name                = "${each.key}-${var.env}"
    description         = "${each.key}-${var.env}"

    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    dynamic "ingress" {
        for_each        = each.value["ports"]

        content {
          from_port     = ingress.value
          to_port       = ingress.value
          protocol      = "tcp"
          cidr_blocks   = ["0.0.0.0/0"]
          description   = ingress.key
        }
    }
}
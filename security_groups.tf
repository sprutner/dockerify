resource "aws_security_group" "allow_me" {
  name = "allow_me"
  description = "Allow me to access"
}

resource "aws_security_group_rule" "allow_ssh" {
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["67.169.94.5/32"]
    security_group_id = "${aws_security_group.allow_me.id}"
  }

resource "aws_security_group_rule" "allow_egress" {
    type = "egress" 
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = "${aws_security_group.allow_me.id}"
  }

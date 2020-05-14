resource "aws_security_group" "efs" {
  count       = var.enable_efs ? 1 : 0
  name        = "${var.swarm_name}-efs-security-group"
  description = "Allows NFS traffic from instances within the VPC."
  vpc_id      = var.vpc_id

  egress {
    cidr_blocks = [aws_vpc.main.cidr_block]
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
  }

  ingress {
    cidr_blocks = [aws_vpc.main.cidr_block]
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
  }
}

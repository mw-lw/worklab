resource "aws_default_vpc" "vpcone" {
  enable_dns_hostnames = true
  //
  tags = {
    Name = "VPC One"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "My Traffic"
  description = "Allow TLS inbound traffic from me"
  vpc_id      = aws_default_vpc.vpcone.id

  ingress {
    description = "TLS from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    // cidr_blocks = []
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#module "aws_eks_audit_log" {
#  source             = "lacework/eks-audit-log/aws"
#  version            = "~> 0.5"
#  cloudwatch_regions = ["us-east-1"]
#  cluster_names      = ["mw-lw"]
#}
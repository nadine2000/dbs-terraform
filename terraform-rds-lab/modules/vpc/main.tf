resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "${var.project_name}-vpc"
  }
}

resource "aws_subnet" "private" {
  count = 2
  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet("10.0.0.0/16", 4, count.index)
  availability_zone = element(["us-east-1a", "us-east-1b"], count.index)
  tags = {
    Name = "${var.project_name}-private-${count.index}"
  }
}

resource "aws_security_group" "rds_sg" {
  vpc_id = aws_vpc.this.id
  name   = "${var.project_name}-rds-sg"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

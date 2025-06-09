resource "aws_db_instance" "this" {
  identifier              = "${var.project_name}-db"
  allocated_storage       = 20
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t3.micro"
  username                = var.db_username
  password                = var.db_password
  db_subnet_group_name    = var.db_subnet_group_id
  vpc_security_group_ids  = var.vpc_security_group_ids
  multi_az                = true
  publicly_accessible     = false
  skip_final_snapshot     = true
}

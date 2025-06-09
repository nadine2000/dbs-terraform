module "vpc" {
  source       = "./modules/vpc"
  project_name = var.project_name
}

module "db_subnet_group" {
  source        = "./modules/db_subnet_group"
  subnet_ids    = module.vpc.private_subnets
  project_name  = var.project_name
}

module "rds" {
  source             = "./modules/rds"
  db_subnet_group_id = module.db_subnet_group.id
  vpc_security_group_ids = [module.vpc.rds_sg_id]
  db_username        = var.db_username
  db_password        = var.db_password
  project_name       = var.project_name
}

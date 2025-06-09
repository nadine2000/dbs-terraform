variable "db_username" {}
variable "db_password" {}
variable "db_subnet_group_id" {}
variable "vpc_security_group_ids" {
  type = list(string)
}
variable "project_name" {}

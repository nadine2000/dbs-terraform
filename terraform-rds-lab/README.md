# Terraform RDS Lab

This project provisions an AWS RDS MySQL instance using Terraform and includes:

- VPC with subnets
- RDS instance (Multi-AZ)
- Subnet group and security groups

## Instructions

1. Configure your AWS CLI
2. Edit `terraform.tfvars` with your DB credentials
3. Run: terraform init
terraform apply
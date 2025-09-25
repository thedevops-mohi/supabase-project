# Database Module

This module manages database-related resources for your EKS environment.

## Purpose

- Provision and configure cloud database resources (e.g., RDS, Aurora).
- Manage database networking, security, and secret integration.

## Typical Resources

- AWS RDS instances or clusters
- Subnet groups for database networking
- Security groups for database access
- Secrets integration for database credentials

## Usage

Include this module in your root Terraform configuration:

```hcl
module "database" {
  source = "./modules/database"
  # Add required variables here
}
```

## Notes

- Ensure your database security groups allow access from your EKS nodes or relevant services.
- Store sensitive credentials in AWS Secrets Manager and reference them using the Secrets Store CSI Driver if needed.

## References

- [AWS RDS Documentation](https://docs.aws.amazon.com/rds/index.html)
- [Secrets Store CSI Driver](https://secrets-store-csi-driver.sigs.k8s.io/)
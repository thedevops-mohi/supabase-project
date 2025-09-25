# Secret Manager Module

This module manages integration with AWS Secrets Manager for your EKS environment.

## Purpose

- Provision and configure secrets in AWS Secrets Manager.
- Enable secure retrieval of secrets by Kubernetes workloads (e.g., via Secrets Store CSI Driver).

## Typical Resources

- AWS Secrets Manager secrets
- IAM policies for secret access
- Integration with Kubernetes via CSI driver

## Usage

Include this module in your root Terraform configuration:

```hcl
module "secret_manager" {
  source = "./modules/secret-manager"
  # Add required variables here
}
```

## Notes

- Ensure IAM roles or Pod Identity associations allow access to the required secrets.
- Use the Secrets Store CSI Driver to mount secrets into pods as needed.

## References

- [AWS Secrets Manager Documentation](https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html)
- [Secrets Store CSI Driver](https://secrets-store-csi-driver.sigs.k8s.io/)
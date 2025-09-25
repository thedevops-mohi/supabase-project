# Security Module

This module manages IAM roles, policies, and Pod Identity associations for your EKS environment.

## Purpose

- Provision IAM roles and policies for EKS cluster, node groups, controllers, and workloads.
- Configure Pod Identity associations for secure AWS access from Kubernetes pods.
- Manage security-related resources required by other modules.

## Typical Resources

- IAM roles for EKS cluster and nodes
- IAM policies for controllers and drivers
- Pod Identity associations for service accounts
- Policy attachments for AWS service integrations

## Usage

Include this module in your root Terraform configuration:

```hcl
module "security" {
  source = "./modules/security"
  # Add required variables here
}
```

## Notes

- Ensure IAM roles and policies are referenced by other modules (EKS, Helm, etc.).
- Pod Identity associations are required for service accounts needing AWS access.
- Review and update policy documents to match your security requirements.

## References

- [AWS IAM Documentation](https://docs.aws.amazon.com/iam/latest/UserGuide/introduction.html)
- [EKS Pod Identity](https://docs.aws.amazon.com/eks/latest/userguide/pod-identity.html)
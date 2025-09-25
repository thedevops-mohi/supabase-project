# EKS Module

This module provisions and configures an Amazon EKS (Elastic Kubernetes Service) cluster.

## Purpose

- Create and manage the EKS control plane.
- Configure node groups for worker nodes.
- Integrate with networking and security modules.

## Typical Resources

- EKS cluster
- Managed node groups
- Cluster IAM roles and policies
- Cluster security group

## Usage

Include this module in your root Terraform configuration:

```hcl
module "eks" {
  source = "./modules/eks"
  # Add required variables here
}
```

## Notes

- Ensure networking and IAM modules are applied before this module.
- Node groups require appropriate IAM roles and subnet configuration.
- Integrate with Pod Identity and other controllers as needed.

## References

- [Amazon EKS Documentation](https://docs.aws.amazon.com/eks/latest/userguide/what-is-eks.html)
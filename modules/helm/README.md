# Helm Module

This module manages the deployment of Kubernetes controllers and drivers using Helm charts.

## Purpose

- Install and configure controllers such as AWS Load Balancer Controller, Secrets Store CSI Driver, and others.
- Manage Helm releases for cluster integrations.

## Typical Resources

- Helm releases for controllers and drivers
- Helm values files for custom configuration

## Usage

Include this module in your root Terraform configuration:

```hcl
module "helm" {
  source = "./modules/helm"
  # Add required variables here
}
```

## Notes

- Ensure your EKS cluster and required IAM roles are provisioned before applying this module.
- Customize Helm values files as needed for your environment.
- Some controllers may require Pod Identity associations or specific service accounts.

## References

- [Helm Documentation](https://helm.sh/docs/)
- [AWS Load Balancer Controller](https://docs.aws.amazon.com/eks/latest/userguide/aws-load-balancer-controller.html)
- [Secrets Store CSI Driver](https://secrets-store-csi-driver.sigs.k8s.io/)
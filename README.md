# stack_ai

This repository contains Terraform and Helm configurations for deploying an EKS cluster on AWS, including support for Pod Identity, AWS Load Balancer Controller, and Secrets Store CSI Driver integration.

> **Note:**  
> I did not use [cdk8s](https://cdk8s.io/) for this project because I am not familiar with it. All Kubernetes resources and infrastructure are managed using Terraform and Helm.

## Structure

- **modules/network/**: VPC, subnets, NAT gateway, and route tables.
- **modules/security/**: IAM roles, policies, and Pod Identity associations.
- **modules/eks/**: EKS cluster and node group resources.
- **modules/helm/**: Helm releases for controllers and drivers.
- **helm-values/**: Example Helm values files (e.g., `supabase.yaml` for CSI secrets).

## Features

- **EKS Cluster**: Managed Kubernetes cluster on AWS.
- **Pod Identity**: Secure IAM role mapping for Kubernetes service accounts.
- **AWS Load Balancer Controller**: Automatic ALB provisioning for Kubernetes services.
- **Secrets Store CSI Driver**: Mount AWS Secrets Manager secrets into pods.

## Usage

**Provision Infrastructure**
   ```sh
   terraform init
   terraform apply
   ```
## Requirements

- AWS CLI configured
- Terraform >= 1.3
- kubectl
- Helm

## Notes

- Ensure IAM roles and Pod Identity associations are created for any service account needing AWS access.
- Update secret names and ARNs to match your environment.
- All infrastructure and Kubernetes resources are managed using Terraform and Helm for consistency and reproducibility.
- For more details and documentation, see the [project documentation](https://stack-ai.notion.site/Take-at-Home-Task-DevOps-Engineer-K8s-Supabase-212974ca255c8015980ee7d969d35899).

## References

- [AWS EKS Pod Identity](https://docs.aws.amazon.com/eks/latest/userguide/pod-identity.html)
- [AWS Load Balancer Controller](https://docs.aws.amazon.com/eks/latest/userguide/aws-load-balancer-controller.html)
- [Secrets Store CSI Driver](https://secrets-store-csi-driver.sigs.k8s.io/)
- [Project Documentation](https://stack-ai.notion.site/Take-at-Home-Task-DevOps-Engineer-K8s-Supabase-212974ca255c8015980ee7d969d35899)
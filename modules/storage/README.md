# Storage Module

This module provisions storage resources for your EKS environment.

## Purpose

- Manage persistent storage for Kubernetes workloads.
- Integrate with AWS storage services such as EBS, EFS, and S3.

## Typical Resources

- EBS volumes and storage classes
- EFS file systems and access points
- S3 buckets for object storage
- IAM policies for storage access

## Usage

Include this module in your root Terraform configuration:

```hcl
module "storage" {
  source = "./modules/storage"
  # Add required variables here
}
```

## Notes

- Ensure IAM roles and policies allow access to required storage resources.
- Configure storage classes and access points to match your workload requirements.
- Integrate with CSI drivers for dynamic provisioning if needed.

## References

- [Amazon EBS Documentation](https://docs.aws.amazon.com/ebs/latest/userguide/what-is-ebs.html)
- [Amazon EFS Documentation](https://docs.aws.amazon.com/efs/latest/ug/whatisefs.html)
- [Amazon S3 Documentation](https://docs.aws.amazon.com/s3/index.html)
- [Kubernetes Storage](https://kubernetes.io/docs/concepts/storage/)
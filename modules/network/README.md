# Network Module

This module provisions networking resources required for your EKS environment.

## Purpose

- Create VPC, subnets (public and private), NAT gateways, and route tables.
- Provide secure and scalable networking for EKS clusters and related resources.

## Typical Resources

- AWS VPC
- Public and private subnets
- NAT gateways
- Route tables and associations

## Usage

Include this module in your root Terraform configuration:

```hcl
module "network" {
  source = "./modules/network"
  # Add required variables here
}
```

## Notes

- Ensure subnet CIDR blocks and availability zones match your requirements.
- Private subnets should have a route to a NAT gateway for outbound internet access.
- Tag subnets for Kubernetes and EKS compatibility.

## References

- [AWS VPC Documentation](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html)
- [Amazon EKS Networking](https://docs.aws.amazon.com/eks/latest/userguide/network_reqs.html)
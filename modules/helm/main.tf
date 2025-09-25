# Deploy AWS Load Balancer Controller using Helm
resource "helm_release" "aws_lbc" {
  name       = var.aws_lbc_helm_name  
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  namespace  = "kube-system"
  version    = "1.13.0"

  # Set required values for the controller
  set {
    name  = "clusterName"
    value = var.value_eks_name
  }

  set {
    name  = "serviceAccount.name"
    value = "aws-load-balancer-controller"
  }

  set {
    name  = "serviceAccount.create"
    value = "true"
  }

  set {
    name  = "region"
    value = var.aws_region
  }

  set {
    name  = "vpcId"
    value = var.vpc_id
  }
}

# Deploy External Secrets operator for syncing secrets from AWS Secrets Manager
resource "helm_release" "external_secrets" {
  name             = "external-secrets"
  namespace        = "default"
  repository       = "https://charts.external-secrets.io"
  chart            = "external-secrets"
  version          = "0.15.1"
  create_namespace = false

  set {
    name  = "installCRDs"
    value = "true"
  }
}

# Deploy Secrets Store CSI Driver for mounting secrets into pods
resource "helm_release" "csi_secrets_store" {
  name             = "csi-secrets-store"
  repository       = "https://kubernetes-sigs.github.io/secrets-store-csi-driver/charts"
  chart            = "secrets-store-csi-driver"
  namespace        = "kube-system"
  create_namespace = false
  version          = "1.4.0"

  # Add values if needed for custom configuration
  values = [

  ]
}

# Deploy AWS provider for Secrets Store CSI Driver
resource "helm_release" "csi_secrets_store_provider_aws" {
  name             = "csi-secrets-store-provider-aws"
  namespace        = "default"
  repository       = "https://aws.github.io/eks-charts"
  chart            = "csi-secrets-store-provider-aws"
  version          = "0.0.4"
  create_namespace = false

  # Optional: override values if needed
  # values = [
  #   file("values.yaml")
  # ]
}

# Deploy Supabase stack using Helm and values.yaml
resource "helm_release" "supabase" {
  # Generates a unique release name, similar to --generate-name in Helm CLI
  name             = "supabase-${substr(md5(timestamp()), 0, 8)}"
  chart            = "./helm-values/supabase-kubernetes/charts/supabase"
  namespace        = "default"
  create_namespace = false

  # Use values from values.yaml for configuration
  values = [
    file("${path.module}/../../helm-values/supabase-kubernetes/charts/supabase/values.yaml")
  ]
}
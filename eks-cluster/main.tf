module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0" # this is module version

  name               = local.common_name
  # kubernetes_version = "1.33"
  kubernetes_version = var.eks_version

  addons = {
    coredns                = {}
    eks-pod-identity-agent = {
      before_compute = true
    }
    kube-proxy             = {}
    vpc-cni                = {
      before_compute = true
    }
    metrics-server = {}

    aws-ebs-csi-driver = {}

    aws-efs-csi-driver = {}
  }

  endpoint_public_access = false
  enable_cluster_creator_admin_permissions = true

  vpc_id                   = "vpc-095356199f2289643"
  subnet_ids               = ["subnet-01134070a41b7710a", "subnet-0e8ee2ccce9d275bd"]
  control_plane_subnet_ids = ["subnet-01134070a41b7710a", "subnet-0e8ee2ccce9d275bd"]
  create_node_security_group = false
  create_security_group      = false
  node_security_group_id = "sg-081a8846ba13dd4e8"
  security_group_id = "sg-081a8846ba13dd4e8"
  

  # EKS Managed Node Group(s)
  eks_managed_node_groups = {
    blue = {
      create = var.enable_blue
      ami_type       = "AL2023_x86_64_STANDARD"
      kubernetes_version = var.eks_nodegroup_blue_version
      instance_types = ["m5.xlarge"]
      iam_role_additional_policies  = {
        amazonEFS = "arn:aws:iam::aws:policy/service-role/AmazonEFSCSIDriverPolicy"
        amazonEBS = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
      }
      
      # cluster nodes autoscaling
      min_size     = 2
      max_size     = 10
      desired_size = 2

      # taints = {
      #   upgrade = {
      #     key = "upgrade"
      #     value = "true"
      #     effect = "NO_SCHEDULE"
      #   }
      # }

      labels = {
        nodegroup = "blue"
      }
    }
  }

  tags = {
    Name = local.common_name
  }
  
}
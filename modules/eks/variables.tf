variable "aws_kms_key" {
  type = object({
    description             = string
    deletion_window_in_days = number
    enable_key_rotation     = bool
    tags                    = map(string)
  })
}

variable "aws_security_group" {
  type = object({
    name_prefix = string
    vpc_id      = string
    ingresses = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
    tags = map(string)
  })
}

variable "aws_eks_cluster" {
  type = object({
    cluster_name                    = string
    cluster_version                 = string
    cluster_endpoint_private_access = bool
    cluster_endpoint_public_access  = bool
    vpc_id                          = string
    subnets                         = list(string)
    cluster_security_group_additional_rules = map(object({
      description                = string
      protocol                   = string
      from_port                  = number
      to_port                    = number
      type                       = string
      source_node_security_group = bool
    }))
    node_security_group_additional_rules = map(object({
      description      = string
      protocol         = string
      from_port        = number
      to_port          = number
      type             = string
      self             = optional(bool)
      cidr_blocks      = optional(list(string))
      ipv6_cidr_blocks = optional(list(string))
    }))
    eks_managed_node_groups = map(object({
      create_launch_template = bool
      launch_template_name   = string
      disk_size              = number
      min_size               = number
      max_size               = number
      desired_size           = number
      capacity_type          = string
      force_update_version   = bool
      instance_types         = list(string)
      labels                 = optional(map(string))
      taints                 = list(map(string))
    }))
    tags = map(any)
  })
}
variable "vpc_cni_irsa" {
  type = object({
    role_name_prefix      = string
    attach_vpc_cni_policy = bool
    vpc_cni_enable_ipv4   = bool
    tags                  = map(string)
  })
}
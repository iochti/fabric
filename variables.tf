variable "domain_name" {
  type = "string"
  description = "Domain name used to create iochti's infra"
}

variable "region_name" {
  type = "string"
  default = "eu-west-1"
  description = "AWS region name (eg: us-west-1)"
}

variable "kops_group_arn_policies" {
  type = "list"
  description = "List of ARN policies used by kops group"
  default = [
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
    "arn:aws:iam::aws:policy/AmazonRoute53FullAccess",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/IAMFullAccess",
    "arn:aws:iam::aws:policy/AmazonVPCFullAccess",
  ]
}

module "kops" {
  source= "./terraform"
}

variable "s3_state_store" {
  default = "iochti.terraform"
}

variable "s3_region" {
  default = "eu-west-1"
}

variable "s3_key" {
  default = "terraform/infrastructure.tfstate"
}
# Store tf configuration in the cloud
terraform {
  backend "s3" {
    bucket = "iochti.terraform"
    key = "terraform/infrastructure.tfstate"
    region = "eu-west-1"
  }
}

data "terraform_remote_state" "tf_s3" {
  backend = "s3"
  config {
    bucket = "${var.s3_state_store}"
    key = "${var.s3_key}"
    region = "${var.s3_region}"
  }
}

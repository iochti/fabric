# Store tf configuration in the cloud
terraform {
  backend "s3" {
    bucket = "iochti.terraform"
    key = "infrastructure.tfstate"
    region = "eu-west-1"
  }
}

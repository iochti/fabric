resource "aws_s3_bucket" "state-storage" {
  bucket = "${join("-", split(".", var.domain_name))}-state-store"
  acl = "private"
  region = "${var.region_name}"

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket" "state-storage" {
  bucket = "${join("-", split(".", var.domain_name))}-state-storage"
  acl = "private"
  region = "${var.region_name}"

  versioning {
    enabled = true
  }
}

output "state-storage-name" {
  value = "${aws_s3_bucket.state-storage.id}"
}

output "user_accesskey_secret_encoded" {
  value = "${aws_iam_access_key.kops_key.encrypted_secret}"
}

output "user_accesskey_id" {
  value = "${aws_iam_access_key.kops_key.id}"
}

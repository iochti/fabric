resource "aws_iam_group" "kops_group" {
  name = "kops"
}

resource "aws_iam_group_policy_attachment" "kops_policies" {
  count = "${length(var.kops_group_arn_policies)}"
  group = "${aws_iam_group.kops_group.name}"
  policy_arn = "${var.kops_group_arn_policies[count.index]}"
}

resource "aws_iam_user" "kops" {
  name = "kops"
}

resource "aws_iam_access_key" "kops_key" {
  user = "${aws_iam_user.kops.name}"
  pgp_key = "${file("./keys/gpg_base64")}"
}

resource "aws_iam_group_membership" "kops_membership" {
  name = "kops-group-membership"
  users = ["${aws_iam_user.kops.name}"]
  group = "${aws_iam_group.kops_group.name}"
}

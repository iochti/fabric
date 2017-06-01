output "cluster_name" {
  value = "iochtik8s.k844.net"
}

output "master_security_group_ids" {
  value = ["${aws_security_group.masters-iochtik8s-k844-net.id}"]
}

output "masters_role_arn" {
  value = "${aws_iam_role.masters-iochtik8s-k844-net.arn}"
}

output "masters_role_name" {
  value = "${aws_iam_role.masters-iochtik8s-k844-net.name}"
}

output "node_security_group_ids" {
  value = ["${aws_security_group.nodes-iochtik8s-k844-net.id}"]
}

output "node_subnet_ids" {
  value = ["${aws_subnet.eu-west-1a-iochtik8s-k844-net.id}"]
}

output "nodes_role_arn" {
  value = "${aws_iam_role.nodes-iochtik8s-k844-net.arn}"
}

output "nodes_role_name" {
  value = "${aws_iam_role.nodes-iochtik8s-k844-net.name}"
}

output "region" {
  value = "eu-west-1"
}

output "vpc_id" {
  value = "${aws_vpc.iochtik8s-k844-net.id}"
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_autoscaling_group" "master-eu-west-1a-masters-iochtik8s-k844-net" {
  name                 = "master-eu-west-1a.masters.iochtik8s.k844.net"
  launch_configuration = "${aws_launch_configuration.master-eu-west-1a-masters-iochtik8s-k844-net.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.eu-west-1a-iochtik8s-k844-net.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "iochtik8s.k844.net"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-eu-west-1a.masters.iochtik8s.k844.net"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group" "nodes-iochtik8s-k844-net" {
  name                 = "nodes.iochtik8s.k844.net"
  launch_configuration = "${aws_launch_configuration.nodes-iochtik8s-k844-net.id}"
  max_size             = 4
  min_size             = 4
  vpc_zone_identifier  = ["${aws_subnet.eu-west-1a-iochtik8s-k844-net.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "iochtik8s.k844.net"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "nodes.iochtik8s.k844.net"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/node"
    value               = "1"
    propagate_at_launch = true
  }
}

resource "aws_ebs_volume" "a-etcd-events-iochtik8s-k844-net" {
  availability_zone = "eu-west-1a"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster    = "iochtik8s.k844.net"
    Name                 = "a.etcd-events.iochtik8s.k844.net"
    "k8s.io/etcd/events" = "a/a"
    "k8s.io/role/master" = "1"
  }
}

resource "aws_ebs_volume" "a-etcd-main-iochtik8s-k844-net" {
  availability_zone = "eu-west-1a"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster    = "iochtik8s.k844.net"
    Name                 = "a.etcd-main.iochtik8s.k844.net"
    "k8s.io/etcd/main"   = "a/a"
    "k8s.io/role/master" = "1"
  }
}

resource "aws_iam_instance_profile" "masters-iochtik8s-k844-net" {
  name = "masters.iochtik8s.k844.net"
  role = "${aws_iam_role.masters-iochtik8s-k844-net.name}"
}

resource "aws_iam_instance_profile" "nodes-iochtik8s-k844-net" {
  name = "nodes.iochtik8s.k844.net"
  role = "${aws_iam_role.nodes-iochtik8s-k844-net.name}"
}

resource "aws_iam_role" "masters-iochtik8s-k844-net" {
  name               = "masters.iochtik8s.k844.net"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_masters.iochtik8s.k844.net_policy")}"
}

resource "aws_iam_role" "nodes-iochtik8s-k844-net" {
  name               = "nodes.iochtik8s.k844.net"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_nodes.iochtik8s.k844.net_policy")}"
}

resource "aws_iam_role_policy" "masters-iochtik8s-k844-net" {
  name   = "masters.iochtik8s.k844.net"
  role   = "${aws_iam_role.masters-iochtik8s-k844-net.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_masters.iochtik8s.k844.net_policy")}"
}

resource "aws_iam_role_policy" "nodes-iochtik8s-k844-net" {
  name   = "nodes.iochtik8s.k844.net"
  role   = "${aws_iam_role.nodes-iochtik8s-k844-net.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_nodes.iochtik8s.k844.net_policy")}"
}

resource "aws_internet_gateway" "iochtik8s-k844-net" {
  vpc_id = "${aws_vpc.iochtik8s-k844-net.id}"

  tags = {
    KubernetesCluster = "iochtik8s.k844.net"
    Name              = "iochtik8s.k844.net"
  }
}

resource "aws_key_pair" "kubernetes-iochtik8s-k844-net-335e3d34aa32107361edccc07343ac91" {
  key_name   = "kubernetes.iochtik8s.k844.net-33:5e:3d:34:aa:32:10:73:61:ed:cc:c0:73:43:ac:91"
  public_key = "${file("${path.module}/data/aws_key_pair_kubernetes.iochtik8s.k844.net-335e3d34aa32107361edccc07343ac91_public_key")}"
}

resource "aws_launch_configuration" "master-eu-west-1a-masters-iochtik8s-k844-net" {
  name_prefix                 = "master-eu-west-1a.masters.iochtik8s.k844.net-"
  image_id                    = "ami-72aaa814"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-iochtik8s-k844-net-335e3d34aa32107361edccc07343ac91.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-iochtik8s-k844-net.id}"
  security_groups             = ["${aws_security_group.masters-iochtik8s-k844-net.id}"]
  associate_public_ip_address = true
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-eu-west-1a.masters.iochtik8s.k844.net_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 20
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }
}

resource "aws_launch_configuration" "nodes-iochtik8s-k844-net" {
  name_prefix                 = "nodes.iochtik8s.k844.net-"
  image_id                    = "ami-72aaa814"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-iochtik8s-k844-net-335e3d34aa32107361edccc07343ac91.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.nodes-iochtik8s-k844-net.id}"
  security_groups             = ["${aws_security_group.nodes-iochtik8s-k844-net.id}"]
  associate_public_ip_address = true
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_nodes.iochtik8s.k844.net_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 20
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }
}

resource "aws_route" "0-0-0-0--0" {
  route_table_id         = "${aws_route_table.iochtik8s-k844-net.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.iochtik8s-k844-net.id}"
}

resource "aws_route_table" "iochtik8s-k844-net" {
  vpc_id = "${aws_vpc.iochtik8s-k844-net.id}"

  tags = {
    KubernetesCluster = "iochtik8s.k844.net"
    Name              = "iochtik8s.k844.net"
  }
}

resource "aws_route_table_association" "eu-west-1a-iochtik8s-k844-net" {
  subnet_id      = "${aws_subnet.eu-west-1a-iochtik8s-k844-net.id}"
  route_table_id = "${aws_route_table.iochtik8s-k844-net.id}"
}

resource "aws_security_group" "masters-iochtik8s-k844-net" {
  name        = "masters.iochtik8s.k844.net"
  vpc_id      = "${aws_vpc.iochtik8s-k844-net.id}"
  description = "Security group for masters"

  tags = {
    KubernetesCluster = "iochtik8s.k844.net"
    Name              = "masters.iochtik8s.k844.net"
  }
}

resource "aws_security_group" "nodes-iochtik8s-k844-net" {
  name        = "nodes.iochtik8s.k844.net"
  vpc_id      = "${aws_vpc.iochtik8s-k844-net.id}"
  description = "Security group for nodes"

  tags = {
    KubernetesCluster = "iochtik8s.k844.net"
    Name              = "nodes.iochtik8s.k844.net"
  }
}

resource "aws_security_group_rule" "all-master-to-master" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-iochtik8s-k844-net.id}"
  source_security_group_id = "${aws_security_group.masters-iochtik8s-k844-net.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-master-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-iochtik8s-k844-net.id}"
  source_security_group_id = "${aws_security_group.masters-iochtik8s-k844-net.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-node-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-iochtik8s-k844-net.id}"
  source_security_group_id = "${aws_security_group.nodes-iochtik8s-k844-net.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "https-external-to-master-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.masters-iochtik8s-k844-net.id}"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "master-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.masters-iochtik8s-k844-net.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.nodes-iochtik8s-k844-net.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-to-master-tcp-1-4000" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-iochtik8s-k844-net.id}"
  source_security_group_id = "${aws_security_group.nodes-iochtik8s-k844-net.id}"
  from_port                = 1
  to_port                  = 4000
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-tcp-4003-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-iochtik8s-k844-net.id}"
  source_security_group_id = "${aws_security_group.nodes-iochtik8s-k844-net.id}"
  from_port                = 4003
  to_port                  = 65535
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-udp-1-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-iochtik8s-k844-net.id}"
  source_security_group_id = "${aws_security_group.nodes-iochtik8s-k844-net.id}"
  from_port                = 1
  to_port                  = 65535
  protocol                 = "udp"
}

resource "aws_security_group_rule" "ssh-external-to-master-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.masters-iochtik8s-k844-net.id}"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ssh-external-to-node-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.nodes-iochtik8s-k844-net.id}"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_subnet" "eu-west-1a-iochtik8s-k844-net" {
  vpc_id            = "${aws_vpc.iochtik8s-k844-net.id}"
  cidr_block        = "172.20.32.0/19"
  availability_zone = "eu-west-1a"

  tags = {
    KubernetesCluster                          = "iochtik8s.k844.net"
    Name                                       = "eu-west-1a.iochtik8s.k844.net"
    "kubernetes.io/cluster/iochtik8s.k844.net" = "owned"
  }
}

resource "aws_vpc" "iochtik8s-k844-net" {
  cidr_block           = "172.20.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    KubernetesCluster                          = "iochtik8s.k844.net"
    Name                                       = "iochtik8s.k844.net"
    "kubernetes.io/cluster/iochtik8s.k844.net" = "owned"
  }
}

resource "aws_vpc_dhcp_options" "iochtik8s-k844-net" {
  domain_name         = "eu-west-1.compute.internal"
  domain_name_servers = ["AmazonProvidedDNS"]

  tags = {
    KubernetesCluster = "iochtik8s.k844.net"
    Name              = "iochtik8s.k844.net"
  }
}

resource "aws_vpc_dhcp_options_association" "iochtik8s-k844-net" {
  vpc_id          = "${aws_vpc.iochtik8s-k844-net.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.iochtik8s-k844-net.id}"
}

terraform = {
  required_version = ">= 0.9.3"
}

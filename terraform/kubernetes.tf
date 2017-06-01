output "cluster_name" {
  value = "iochticluster.k844.net"
}

output "master_security_group_ids" {
  value = ["${aws_security_group.masters-iochticluster-k844-net.id}"]
}

output "masters_role_arn" {
  value = "${aws_iam_role.masters-iochticluster-k844-net.arn}"
}

output "masters_role_name" {
  value = "${aws_iam_role.masters-iochticluster-k844-net.name}"
}

output "node_security_group_ids" {
  value = ["${aws_security_group.nodes-iochticluster-k844-net.id}"]
}

output "node_subnet_ids" {
  value = ["${aws_subnet.eu-west-1a-iochticluster-k844-net.id}", "${aws_subnet.eu-west-1b-iochticluster-k844-net.id}", "${aws_subnet.eu-west-1c-iochticluster-k844-net.id}"]
}

output "nodes_role_arn" {
  value = "${aws_iam_role.nodes-iochticluster-k844-net.arn}"
}

output "nodes_role_name" {
  value = "${aws_iam_role.nodes-iochticluster-k844-net.name}"
}

output "region" {
  value = "eu-west-1"
}

output "vpc_id" {
  value = "${aws_vpc.iochticluster-k844-net.id}"
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_autoscaling_group" "master-eu-west-1a-masters-iochticluster-k844-net" {
  name                 = "master-eu-west-1a.masters.iochticluster.k844.net"
  launch_configuration = "${aws_launch_configuration.master-eu-west-1a-masters-iochticluster-k844-net.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.eu-west-1a-iochticluster-k844-net.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "iochticluster.k844.net"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-eu-west-1a.masters.iochticluster.k844.net"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group" "master-eu-west-1b-masters-iochticluster-k844-net" {
  name                 = "master-eu-west-1b.masters.iochticluster.k844.net"
  launch_configuration = "${aws_launch_configuration.master-eu-west-1b-masters-iochticluster-k844-net.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.eu-west-1b-iochticluster-k844-net.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "iochticluster.k844.net"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-eu-west-1b.masters.iochticluster.k844.net"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group" "master-eu-west-1c-masters-iochticluster-k844-net" {
  name                 = "master-eu-west-1c.masters.iochticluster.k844.net"
  launch_configuration = "${aws_launch_configuration.master-eu-west-1c-masters-iochticluster-k844-net.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.eu-west-1c-iochticluster-k844-net.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "iochticluster.k844.net"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-eu-west-1c.masters.iochticluster.k844.net"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group" "nodes-iochticluster-k844-net" {
  name                 = "nodes.iochticluster.k844.net"
  launch_configuration = "${aws_launch_configuration.nodes-iochticluster-k844-net.id}"
  max_size             = 2
  min_size             = 2
  vpc_zone_identifier  = ["${aws_subnet.eu-west-1a-iochticluster-k844-net.id}", "${aws_subnet.eu-west-1b-iochticluster-k844-net.id}", "${aws_subnet.eu-west-1c-iochticluster-k844-net.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "iochticluster.k844.net"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "nodes.iochticluster.k844.net"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/node"
    value               = "1"
    propagate_at_launch = true
  }
}

resource "aws_ebs_volume" "a-etcd-events-iochticluster-k844-net" {
  availability_zone = "eu-west-1a"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster    = "iochticluster.k844.net"
    Name                 = "a.etcd-events.iochticluster.k844.net"
    "k8s.io/etcd/events" = "a/a,b,c"
    "k8s.io/role/master" = "1"
  }
}

resource "aws_ebs_volume" "a-etcd-main-iochticluster-k844-net" {
  availability_zone = "eu-west-1a"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster    = "iochticluster.k844.net"
    Name                 = "a.etcd-main.iochticluster.k844.net"
    "k8s.io/etcd/main"   = "a/a,b,c"
    "k8s.io/role/master" = "1"
  }
}

resource "aws_ebs_volume" "b-etcd-events-iochticluster-k844-net" {
  availability_zone = "eu-west-1b"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster    = "iochticluster.k844.net"
    Name                 = "b.etcd-events.iochticluster.k844.net"
    "k8s.io/etcd/events" = "b/a,b,c"
    "k8s.io/role/master" = "1"
  }
}

resource "aws_ebs_volume" "b-etcd-main-iochticluster-k844-net" {
  availability_zone = "eu-west-1b"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster    = "iochticluster.k844.net"
    Name                 = "b.etcd-main.iochticluster.k844.net"
    "k8s.io/etcd/main"   = "b/a,b,c"
    "k8s.io/role/master" = "1"
  }
}

resource "aws_ebs_volume" "c-etcd-events-iochticluster-k844-net" {
  availability_zone = "eu-west-1c"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster    = "iochticluster.k844.net"
    Name                 = "c.etcd-events.iochticluster.k844.net"
    "k8s.io/etcd/events" = "c/a,b,c"
    "k8s.io/role/master" = "1"
  }
}

resource "aws_ebs_volume" "c-etcd-main-iochticluster-k844-net" {
  availability_zone = "eu-west-1c"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster    = "iochticluster.k844.net"
    Name                 = "c.etcd-main.iochticluster.k844.net"
    "k8s.io/etcd/main"   = "c/a,b,c"
    "k8s.io/role/master" = "1"
  }
}

resource "aws_iam_instance_profile" "masters-iochticluster-k844-net" {
  name = "masters.iochticluster.k844.net"
  role = "${aws_iam_role.masters-iochticluster-k844-net.name}"
}

resource "aws_iam_instance_profile" "nodes-iochticluster-k844-net" {
  name = "nodes.iochticluster.k844.net"
  role = "${aws_iam_role.nodes-iochticluster-k844-net.name}"
}

resource "aws_iam_role" "masters-iochticluster-k844-net" {
  name               = "masters.iochticluster.k844.net"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_masters.iochticluster.k844.net_policy")}"
}

resource "aws_iam_role" "nodes-iochticluster-k844-net" {
  name               = "nodes.iochticluster.k844.net"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_nodes.iochticluster.k844.net_policy")}"
}

resource "aws_iam_role_policy" "masters-iochticluster-k844-net" {
  name   = "masters.iochticluster.k844.net"
  role   = "${aws_iam_role.masters-iochticluster-k844-net.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_masters.iochticluster.k844.net_policy")}"
}

resource "aws_iam_role_policy" "nodes-iochticluster-k844-net" {
  name   = "nodes.iochticluster.k844.net"
  role   = "${aws_iam_role.nodes-iochticluster-k844-net.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_nodes.iochticluster.k844.net_policy")}"
}

resource "aws_internet_gateway" "iochticluster-k844-net" {
  vpc_id = "${aws_vpc.iochticluster-k844-net.id}"

  tags = {
    KubernetesCluster = "iochticluster.k844.net"
    Name              = "iochticluster.k844.net"
  }
}

resource "aws_key_pair" "kubernetes-iochticluster-k844-net-e3aa98fa8368d091dd02bb5c4bf93c89" {
  key_name   = "kubernetes.iochticluster.k844.net-e3:aa:98:fa:83:68:d0:91:dd:02:bb:5c:4b:f9:3c:89"
  public_key = "${file("${path.module}/data/aws_key_pair_kubernetes.iochticluster.k844.net-e3aa98fa8368d091dd02bb5c4bf93c89_public_key")}"
}

resource "aws_launch_configuration" "master-eu-west-1a-masters-iochticluster-k844-net" {
  name_prefix                 = "master-eu-west-1a.masters.iochticluster.k844.net-"
  image_id                    = "ami-72aaa814"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-iochticluster-k844-net-e3aa98fa8368d091dd02bb5c4bf93c89.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-iochticluster-k844-net.id}"
  security_groups             = ["${aws_security_group.masters-iochticluster-k844-net.id}"]
  associate_public_ip_address = true
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-eu-west-1a.masters.iochticluster.k844.net_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 20
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }
}

resource "aws_launch_configuration" "master-eu-west-1b-masters-iochticluster-k844-net" {
  name_prefix                 = "master-eu-west-1b.masters.iochticluster.k844.net-"
  image_id                    = "ami-72aaa814"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-iochticluster-k844-net-e3aa98fa8368d091dd02bb5c4bf93c89.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-iochticluster-k844-net.id}"
  security_groups             = ["${aws_security_group.masters-iochticluster-k844-net.id}"]
  associate_public_ip_address = true
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-eu-west-1b.masters.iochticluster.k844.net_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 20
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }
}

resource "aws_launch_configuration" "master-eu-west-1c-masters-iochticluster-k844-net" {
  name_prefix                 = "master-eu-west-1c.masters.iochticluster.k844.net-"
  image_id                    = "ami-72aaa814"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-iochticluster-k844-net-e3aa98fa8368d091dd02bb5c4bf93c89.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-iochticluster-k844-net.id}"
  security_groups             = ["${aws_security_group.masters-iochticluster-k844-net.id}"]
  associate_public_ip_address = true
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-eu-west-1c.masters.iochticluster.k844.net_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 20
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }
}

resource "aws_launch_configuration" "nodes-iochticluster-k844-net" {
  name_prefix                 = "nodes.iochticluster.k844.net-"
  image_id                    = "ami-72aaa814"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-iochticluster-k844-net-e3aa98fa8368d091dd02bb5c4bf93c89.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.nodes-iochticluster-k844-net.id}"
  security_groups             = ["${aws_security_group.nodes-iochticluster-k844-net.id}"]
  associate_public_ip_address = true
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_nodes.iochticluster.k844.net_user_data")}"

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
  route_table_id         = "${aws_route_table.iochticluster-k844-net.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.iochticluster-k844-net.id}"
}

resource "aws_route_table" "iochticluster-k844-net" {
  vpc_id = "${aws_vpc.iochticluster-k844-net.id}"

  tags = {
    KubernetesCluster = "iochticluster.k844.net"
    Name              = "iochticluster.k844.net"
  }
}

resource "aws_route_table_association" "eu-west-1a-iochticluster-k844-net" {
  subnet_id      = "${aws_subnet.eu-west-1a-iochticluster-k844-net.id}"
  route_table_id = "${aws_route_table.iochticluster-k844-net.id}"
}

resource "aws_route_table_association" "eu-west-1b-iochticluster-k844-net" {
  subnet_id      = "${aws_subnet.eu-west-1b-iochticluster-k844-net.id}"
  route_table_id = "${aws_route_table.iochticluster-k844-net.id}"
}

resource "aws_route_table_association" "eu-west-1c-iochticluster-k844-net" {
  subnet_id      = "${aws_subnet.eu-west-1c-iochticluster-k844-net.id}"
  route_table_id = "${aws_route_table.iochticluster-k844-net.id}"
}

resource "aws_security_group" "masters-iochticluster-k844-net" {
  name        = "masters.iochticluster.k844.net"
  vpc_id      = "${aws_vpc.iochticluster-k844-net.id}"
  description = "Security group for masters"

  tags = {
    KubernetesCluster = "iochticluster.k844.net"
    Name              = "masters.iochticluster.k844.net"
  }
}

resource "aws_security_group" "nodes-iochticluster-k844-net" {
  name        = "nodes.iochticluster.k844.net"
  vpc_id      = "${aws_vpc.iochticluster-k844-net.id}"
  description = "Security group for nodes"

  tags = {
    KubernetesCluster = "iochticluster.k844.net"
    Name              = "nodes.iochticluster.k844.net"
  }
}

resource "aws_security_group_rule" "all-master-to-master" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-iochticluster-k844-net.id}"
  source_security_group_id = "${aws_security_group.masters-iochticluster-k844-net.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-master-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-iochticluster-k844-net.id}"
  source_security_group_id = "${aws_security_group.masters-iochticluster-k844-net.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-node-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-iochticluster-k844-net.id}"
  source_security_group_id = "${aws_security_group.nodes-iochticluster-k844-net.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "https-external-to-master-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.masters-iochticluster-k844-net.id}"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "master-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.masters-iochticluster-k844-net.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.nodes-iochticluster-k844-net.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-to-master-tcp-1-4000" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-iochticluster-k844-net.id}"
  source_security_group_id = "${aws_security_group.nodes-iochticluster-k844-net.id}"
  from_port                = 1
  to_port                  = 4000
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-tcp-4003-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-iochticluster-k844-net.id}"
  source_security_group_id = "${aws_security_group.nodes-iochticluster-k844-net.id}"
  from_port                = 4003
  to_port                  = 65535
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-udp-1-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-iochticluster-k844-net.id}"
  source_security_group_id = "${aws_security_group.nodes-iochticluster-k844-net.id}"
  from_port                = 1
  to_port                  = 65535
  protocol                 = "udp"
}

resource "aws_security_group_rule" "ssh-external-to-master-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.masters-iochticluster-k844-net.id}"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ssh-external-to-node-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.nodes-iochticluster-k844-net.id}"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_subnet" "eu-west-1a-iochticluster-k844-net" {
  vpc_id            = "${aws_vpc.iochticluster-k844-net.id}"
  cidr_block        = "172.20.32.0/19"
  availability_zone = "eu-west-1a"

  tags = {
    KubernetesCluster                              = "iochticluster.k844.net"
    Name                                           = "eu-west-1a.iochticluster.k844.net"
    "kubernetes.io/cluster/iochticluster.k844.net" = "owned"
  }
}

resource "aws_subnet" "eu-west-1b-iochticluster-k844-net" {
  vpc_id            = "${aws_vpc.iochticluster-k844-net.id}"
  cidr_block        = "172.20.64.0/19"
  availability_zone = "eu-west-1b"

  tags = {
    KubernetesCluster                              = "iochticluster.k844.net"
    Name                                           = "eu-west-1b.iochticluster.k844.net"
    "kubernetes.io/cluster/iochticluster.k844.net" = "owned"
  }
}

resource "aws_subnet" "eu-west-1c-iochticluster-k844-net" {
  vpc_id            = "${aws_vpc.iochticluster-k844-net.id}"
  cidr_block        = "172.20.96.0/19"
  availability_zone = "eu-west-1c"

  tags = {
    KubernetesCluster                              = "iochticluster.k844.net"
    Name                                           = "eu-west-1c.iochticluster.k844.net"
    "kubernetes.io/cluster/iochticluster.k844.net" = "owned"
  }
}

resource "aws_vpc" "iochticluster-k844-net" {
  cidr_block           = "172.20.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    KubernetesCluster                              = "iochticluster.k844.net"
    Name                                           = "iochticluster.k844.net"
    "kubernetes.io/cluster/iochticluster.k844.net" = "owned"
  }
}

resource "aws_vpc_dhcp_options" "iochticluster-k844-net" {
  domain_name         = "eu-west-1.compute.internal"
  domain_name_servers = ["AmazonProvidedDNS"]

  tags = {
    KubernetesCluster = "iochticluster.k844.net"
    Name              = "iochticluster.k844.net"
  }
}

resource "aws_vpc_dhcp_options_association" "iochticluster-k844-net" {
  vpc_id          = "${aws_vpc.iochticluster-k844-net.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.iochticluster-k844-net.id}"
}

terraform = {
  required_version = ">= 0.9.3"
}

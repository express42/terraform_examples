# Creates private_lan
resource "openstack_networking_network_v2" "private_lan_1" {
  name = "${var.private_lan["name"]}"
  admin_state_up = "true"
  region = "${var.region}"
}

# Assign subnet to it
resource "openstack_networking_subnet_v2" "private_lan_1" {
  network_id = "${openstack_networking_network_v2.private_lan_1.id}"
  name = "${var.private_lan["name"]}"
  cidr = "${var.private_lan["cidr"]}"
  ip_version = 4
  region = "${var.region}"
}

# Creates gateway with external net
resource "openstack_networking_router_v2" "gw_private" {
  name = "private_lan_escaper"
  # Static id for selectel external-network
  external_gateway = "ab2264dd-bde8-4a97-b0da-5fea63191019"
  region = "${var.region}"
}

# Attach our network to gateway
resource "openstack_networking_router_interface_v2" "gw_private" {
  region = "${var.region}"
  router_id = "${openstack_networking_router_v2.gw_private.id}"
  subnet_id = "${openstack_networking_subnet_v2.private_lan_1.id}"
}

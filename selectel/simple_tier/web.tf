resource "template_file" "web_init" {
  count    = "${var.web_server_params["count"]}"
  template = "${server_name}"
  vars {
    server_name = "${format("${var.web_server_params["name"]}%02d", count.index+1)}.${var.project_tld}"
  }
}

resource "openstack_blockstorage_volume_v2" "web_vol" {
  count = "${var.web_server_params["count"]}"
  name = "disk-for-${element(template_file.web_init.*.rendered, count.index)}"
  size = "${var.web_server_params["volume_size"]}"
  volume_type = "${var.web_server_params["volume_type"]}"
  image_id = "${var.web_server_params["image_id"]}"
  region = "${var.region}"
  lifecycle {
    ignore_changes = ["name"]
  }
}

resource "openstack_compute_instance_v2" "web_instance" {
  count = "${var.web_server_params["count"]}"
  name = "${element(template_file.web_init.*.rendered, count.index)}"
  flavor_id = "${var.web_server_params["flavor"]}"
  region = "${var.region}"
  key_pair = "shared"
  block_device {
    uuid = "${element(openstack_blockstorage_volume_v2.web_vol.*.id, count.index)}"
    source_type = "volume"
    boot_index = 0
    destination_type = "volume"
  }
  metadata {
    type = "${var.web_server_params["name"]}"
  }
  network {
    name = "${var.private_lan["name"]}"
    floating_ip = "${element(var.web_floating_ips,count.index)}"
  }
  lifecycle {
    ignore_changes = ["name", "block_device"]
  }
}

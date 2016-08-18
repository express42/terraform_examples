resource "openstack_compute_keypair_v2" "shared" {
  name = "shared"
  region = "${var.region}"
  public_key = "${var.project_ssh_pubkey}"
}

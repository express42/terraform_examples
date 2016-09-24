provider "openstack" {
    user_name  = "${var.selectel_user_name}"
    domain_name = "${var.selectel_domain_name}"
    tenant_name = "${var.selectel_tenant_name}"
    tenant_id = "${var.selectel_tenant_id}"
    password  = "${var.selectel_password}"
    auth_url  = "https://api.selvpc.ru/identity/v3"
}

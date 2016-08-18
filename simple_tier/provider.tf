provider "openstack" {
    user_name  = "${var.selectel["user_name"]}"
    domain_name = "${var.selectel["domain_name"]}"
    tenant_name = "${var.selectel["tenant_name"]}"
    tenant_id = "${var.selectel["tenant_id"]}"
    password  = "${var.selectel["password"]}"
    auth_url  = "https://api.selvpc.ru/identity/v3"
}

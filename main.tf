resource "aviatrix_site2cloud" "site2cloud" {
    vpc_id = var.vpc_id
    connection_name = "cloud-to-site-ike-1"
    connection_type = "unmapped"
    remote_gateway_type = "generic"
    tunnel_type = "policy"
    primary_cloud_gateway_name = var.primary_cloud_gateway_name
    remote_gateway_ip = var.remote_gateway_ip
    ha_enabled = false
    private_route_encryption = false
    remote_subnet_cidr = "${var.remote_subnet_cidr}/32"
    local_subnet_cidr = var.local_subnet_cidr
    custom_algorithms = local.algorithm ? false : true
    phase_1_authentication = local.algorithm ? "" : var.phase_1_authentication
    phase_2_authentication = local.algorithm ? "" : var.phase_2_authentication
    phase_1_dh_groups = var.phase_1_dh_groups
    phase_2_dh_groups = var.phase_2_dh_groups
    phase_1_encryption = var.phase_1_encryption
    phase_2_encryption = var.phase_2_encryption
    pre_shared_key = var.pre_shared_key
    backup_pre_shared_key = ""
    enable_dead_peer_detection = true
    enable_ikev2 = var.enable_ikev2
    enable_active_active = false
    forward_traffic_to_transit = false
    custom_mapped = false
    enable_event_triggered_ha = null
}

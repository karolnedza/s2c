resource "aviatrix_site2cloud" "site2cloud" {
    vpc_id = var.vpc_id[var.region]
    connection_name = var.connection_name
    connection_type = "unmapped"
    remote_gateway_type = "generic"
    tunnel_type = "policy"
    primary_cloud_gateway_name = var.primary_cloud_gateway_name[var.region]
    remote_gateway_ip = var.remote_gateway_ip
    ha_enabled = false
    private_route_encryption = false
    remote_subnet_cidr = "${var.remote_subnet_cidr}/32"
    local_subnet_cidr = var.local_subnet_cidr
    custom_algorithms = local.algorithm ? false : true
    phase_1_authentication = local.algorithm ? null : var.phase_1_authentication
    phase_2_authentication = local.algorithm ? null : var.phase_2_authentication
    phase_1_dh_groups = local.algorithm ? null : var.phase_1_dh_groups
    phase_2_dh_groups = local.algorithm ? null : var.phase_2_dh_groups
    phase_1_encryption = local.algorithm ? null : var.phase_1_encryption
    phase_2_encryption = local.algorithm ? null : var.phase_2_encryption
    pre_shared_key = var.pre_shared_key
    backup_pre_shared_key = ""
    enable_dead_peer_detection = true
    enable_ikev2 = var.enable_ikev2
    enable_active_active = false
    forward_traffic_to_transit = false
    custom_mapped = false
    enable_event_triggered_ha = null
}


resource "aviatrix_gateway_dnat" "gateway_dnat_1" {
    gw_name = var.primary_cloud_gateway_name[var.region]
    dnat_policy {
        src_cidr = "${var.remote_subnet_cidr}/32"
        dst_cidr = var.local_subnet_cidr
        protocol = "all"
        interface = "eth0"
        connection = "${aviatrix_site2cloud.site2cloud.connection_name}@site2cloud"
        dnat_ips = "10.10.10.60"
    }

    sync_to_ha = true
}

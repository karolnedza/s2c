
variable "ctrl_ip" {}
variable "ctrl_password" {}



variable "vpc_id" {}
variable "primary_cloud_gateway_name" {}
variable "remote_gateway_ip" {}
variable "remote_subnet_cidr" {}
variable "local_subnet_cidr" {}
variable "phase_1_authentication" {}
variable "phase_2_authentication" {}
variable "phase_1_dh_groups" {}
variable "phase_2_dh_groups" {}
variable "phase_1_encryption" {}
variable "phase_2_encryption" {}
variable "pre_shared_key" {}
variable "enable_ikev2" {}


locals {
  algorithm = alltrue([var.phase_1_authentication == "SHA-256",
      var.phase_2_authentication == "HMAC-SHA-256"])
}
# locals {
#   algorithm = alltrue([var.phase_1_authentication == "SHA256",
#       var.phase_2_authentication == "HMAC-SHA256",
#       var.phase_1_dh_groups == "14",
#       var.phase_2_dh_groups == "14",
#       var.phase_1_encryption == "AES-256-CBC",
#       var.phase_2_encryption == "AES-256-CBC"])
# }

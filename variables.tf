
variable "ctrl_ip" {}
variable "ctrl_password" {}



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

variable "region" {}
variable "vcs_repository" {}
variable "connection_name" {}


variable "vpc_id" {
  type        = map(string)
  default     = {
    "emea"     = "vpc-00dc922595dec2df8",
    "apj" =   "vpc-07780687ec06cafe5",
    "america" = "vpc-059dd5ff536e26085"
  }
}

variable "primary_cloud_gateway_name" {
  type        = map(string)
  default     = {
    "emea"     = "emea-gw",
    "apj" =   "apj-gw",
    "america" = "us-gw"
  }
}


locals {
  algorithm = alltrue([var.phase_1_authentication == "SHA-256",
      var.phase_2_authentication == "HMAC-SHA-256",
      var.phase_1_dh_groups == "14",
      var.phase_2_dh_groups == "14",
      var.phase_1_encryption == "AES-256-CBC",
      var.phase_2_encryption == "AES-256-CBC"])
}

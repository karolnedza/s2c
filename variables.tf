
variable "ctrl_ip" {}
variable "ctrl_password" {}



variable "remote_gateway_ip" {}
variable "remote_subnet_cidr" {}
variable "phase_1_authentication" {}
variable "phase_2_authentication" {}
variable "phase_1_dh_groups" {}
variable "phase_2_dh_groups" {}
variable "phase_1_encryption" {}
variable "phase_2_encryption" {}
variable "pre_shared_key" {}
variable "enable_ikev2" {}

variable "region" {}
variable "connection_name" {}


variable "vpc_id" {
  type        = map(string)
  default     = {
    "emea"     = "vpc-0b6a3bf82c51ffb76",
    "apj" =   "vpc-0dc8b4c13b2192959",
    "america" = "vpc-004108211c08e1cbf"
  }
}

variable "primary_cloud_gateway_name" {
  type        = map(string)
  default     = {
    "emea"     = "gw-emea",
    "apj" =   "gw-apac",
    "america" = "gw-us"
  }
}


variable "local_subnet_cidr" {
  type        = map(string)
  default     = {
    "emea"     = "1.1.1.1/32",
    "apj" =   "2.2.2.2/32",
    "america" = "3.3.3.3/32"
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

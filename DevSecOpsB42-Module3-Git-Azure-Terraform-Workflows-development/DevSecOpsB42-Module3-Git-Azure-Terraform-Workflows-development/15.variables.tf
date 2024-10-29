variable "rgname" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Location of the resource group"
  validation {
    condition     = contains(["eastus", "westus", "centralus"], var.location)
    error_message = "Invalid location"
  }
}

variable "env" {}
variable "batch" {}
variable "owner" {}
variable "vnet1_address_space" {}
variable "subnet1_cidr_block" {}
variable "subnet2_cidr_block" {}
variable "subnet3_cidr_block" {}
variable "subnet4_cidr_block" {}
variable "vm_size" {}
variable "admin_username" {}
variable "dns_zone" {}
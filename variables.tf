variable "project_id" {
  type        = string
  description = "Project ID"
}

variable "dns_name" {
  type        = string
  description = "Name of the dns entry that will point to the LB IP"
  default     = ""
}

variable "dns_zone" {
  type        = string
  description = "Name of the dns zone"
  default     = ""
}

variable "create_dns_entry" {
  type        = bool
  default     = true
  description = "Whether to create a dns entry or not"
}

variable "intercom_fqdn" {
  type        = string
  default     = "custom.intercom.help"
  description = "Domain of the intercom server"
}

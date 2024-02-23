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

variable "intercom_port" {
  type        = number
  default     = 80
  description = "Port to reach Intercom with"
}

variable "backend_service_protocol" {
  type        = string
  default     = "HTTP"
  description = "Protocol for backend service"
}

variable "enable_hsts" {
  type        = bool
  default     = false
  description = "Sets a Strict-Transport-Security header"
}

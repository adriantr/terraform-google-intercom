resource "google_compute_global_network_endpoint_group" "main" {
  name                  = "intercom"
  default_port          = var.intercom_port
  network_endpoint_type = "INTERNET_FQDN_PORT"
}

resource "google_compute_global_network_endpoint" "main" {
  global_network_endpoint_group = google_compute_global_network_endpoint_group.main.id
  port                          = var.intercom_port
  fqdn                          = var.intercom_fqdn
}

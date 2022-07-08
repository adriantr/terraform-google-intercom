resource "google_compute_global_network_endpoint_group" "main" {
  name                  = "intercom"
  default_port          = 433
  network_endpoint_type = "INTERNET_FQDN_PORT"
}

resource "google_compute_global_network_endpoint" "main" {
  global_network_endpoint_group = google_compute_global_network_endpoint_group.main.id
  port                          = 433
  fqdn                          = var.intercom_fqdn
}

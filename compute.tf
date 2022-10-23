resource "google_compute_managed_ssl_certificate" "main" {
  name = "intercom"

  managed {
    domains = ["${var.dns_name}."]
  }
}

resource "google_compute_global_address" "main" {
  address_type = "EXTERNAL"
  name         = "intercom"
}

resource "google_compute_backend_service" "main" {
  name     = "intercom"
  protocol = var.backend_service_protocol
  backend {
    group = google_compute_global_network_endpoint_group.main.id
  }
}

resource "google_compute_url_map" "main" {
  name            = "intercom"
  default_service = google_compute_backend_service.main.id
}

resource "google_compute_target_https_proxy" "main" {
  name             = "intercom"
  url_map          = google_compute_url_map.main.id
  ssl_certificates = [google_compute_managed_ssl_certificate.main.id]
}

resource "google_compute_global_forwarding_rule" "main" {
  name                  = "intercom"
  ip_address            = google_compute_global_address.main.address
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL"
  target                = google_compute_target_https_proxy.main.id
  port_range            = 443
}

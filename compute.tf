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

resource "google_compute_url_map" "http-redirect" {
  name = "http-redirect"

  default_url_redirect {
    strip_query            = false
    https_redirect         = true
  }
}

resource "google_compute_target_http_proxy" "http-redirect" {
  name    = "http-redirect"
  url_map = google_compute_url_map.http-redirect.self_link
}

resource "google_compute_global_forwarding_rule" "http-redirect" {
  name       = "http-redirect"
  target     = google_compute_target_http_proxy.http-redirect.self_link
  ip_address = google_compute_global_address.main.address
  port_range = "80"
}

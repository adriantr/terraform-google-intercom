resource "google_dns_record_set" "main" {
  count        = var.create_dns_entry ? 1 : 0
  managed_zone = data.google_dns_managed_zone.main[0].name
  name         = "${var.dns_name}."
  type         = "A"

  rrdatas = [google_compute_global_address.main.address]
}

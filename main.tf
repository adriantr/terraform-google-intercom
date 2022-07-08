data "google_dns_managed_zone" "main" {
  count = var.create_dns_entry ? 1 : 0

  project = var.project_id
  name    = var.dns_zone
}

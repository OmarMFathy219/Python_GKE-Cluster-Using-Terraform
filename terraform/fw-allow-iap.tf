#IAP firwall 
resource "google_compute_firewall" "fw-allow-iap" {
  name    = "fw-allow-iap"
  network = google_compute_network.main-network.id
  allow {
    protocol = "tcp"
    ports    = ["80", "22"]
  }
  direction     = "INGRESS"
  source_ranges = ["35.235.240.0/20"]
}
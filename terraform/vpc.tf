resource "google_compute_network" "main-network" {
  name                    = "main-network"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}
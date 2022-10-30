#it's recommended to create service account for gke 
resource "google_service_account" "node-service-account" {
  account_id = "node-service-account"
  project = "master-scope-366108"
}

#grant access to service account usinf iam binding
resource "google_project_iam_binding" "node-service-account-iam" {
  project = "master-scope-366108"
  role    = "roles/storage.admin"
  members = [
    "serviceAccount:${google_service_account.node-service-account.email}"
  ]
}
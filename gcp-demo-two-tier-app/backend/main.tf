provider "google" {
  project = "terraform-gcp-demo-415118"
  region = "us-central1"
}

resource "google_storage_bucket" "demo-backend-training" {
  name = "ca-demo-tf-state-training"
  location = "US"
}
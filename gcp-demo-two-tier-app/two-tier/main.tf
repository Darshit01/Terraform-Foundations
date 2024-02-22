terraform {
  backend "gcs" {
    bucket = "ca-demo-tf-state-training"
    prefix = "terraform/state"
  }
}

provider "google" {
  project = "terraform-gcp-demo-415118"
  region = "${var.region}"
}

provider "kubernetes" {
  host = "${google_container_cluser.primary.endpoint}"
  username = "${google_container.primary.master_auth.0.username}"
  password = "${google_container.primary.master_auth.0.password}"

  client_certificate = "${base64decode(google_container_cluster.primary.master.auth.0.client_certificate)}"
  client_key = "${base64decode(google_container_cluster.primary.master.auth.0.client_key)}"
  cluster_ca_certificate = "${base64decode(google_container_cluster.primary.master.auth.0.cluster_ca_certificate)}"

}
resource "google_container_cluster" "primary" {
  name = "ca-gke-${terraform.workspace}-cluster"
  initial_node_count = "${var.gke_num_nodes[terraform.workspace]}"

  node_config {
    oauth_scopes = [
        "https://www.googleapis.com/auth/compute",
        "https://www.googleapis.com/auth/devstorage.read_only",
        "https://www.googleapis.com/auth/logging.write",
        "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
provider "google" {
  project = "terraform-gcp-demo-415118"
  region = "us-central1"
}

resource "google_compute_disk" "default" {
  count = 3
  name = "test-disk-${count.index}"
  type = "pd-ssd"
  image = "debian-8-jessie-v20170523"
  zone = "us-central1-a"

  provisioner "local-exec" {
    command = "echo disk ${count.index}: ${self.self_link} >> disk_urls.txt"
  }
}

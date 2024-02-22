#GCP variables
variable "region" {
    default = "us-centraol1"
    description = "Region of resources"
}

# Cloud SQL Variables
variable "sql_instance_size" {
  default = "db-f1-micro"
  description = "Size of Cloud SQL instances"
}

variable "sql_disk_type" {
  default = "PD_SSD"
  description = "Cloud SQL instance disk type"
}

variable "sql_disk_size" {
  default = "10"
  description = "Stores size in GB"
}

variable "sql_require_ssl" {
  default = "false"
  description = "Enforse SSL connections"
}

variable "sql_connect_retry_interval" {
  default = 60
  description = "The number of seconds between connect retries"
}

variable "sql_master_zone" {
  default = "a"
  description = "Zone of the Cloud SQL master (a, b, ...)"
}

variable "sql_replica_zone" {
  default = "b"
  description = "Zone of the Cloud SQL master (a, b, ...)"
}

variable "sql_user" {
  default = "admin"
  description = "Username of the host to access the database"
}

variable "sql_pass" {
  description = "Pass of host to access the database"
}

# GKE varaibles

variable "gke_num_nodes" {
  default = {
    prod = 2
    dev = 1
  }
  description = "Number of nodes in each GKE cluster zone"
}

variable "gke_master_user" {
  default = "k8s_admin"
  description = "Username to authenticate with k8s master"
}

variable "gke_master_pass" {
  description = "Pass"
}

variable "gke_node_machine_type" {
  default = "n1-standard-1"
  description = "Machine type of GKE nodes"
}

#k8s variables
variable "k8s_num_wp_replicas" {
  default = {
    prod = 2
    dev = 1
  }
  description = "Number of WordPress frontend replicas"
}
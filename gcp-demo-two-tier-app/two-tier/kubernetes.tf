resource "kubernetes_secret" "mysql" {
  metadata {
    name = "mysql-pass"
  }
  data = {
    password = "${var.sql_pass}"
  }
}

resource "kubernetes_service" "wordpress" {
  metadata {
    name = "wordpress"
    labels = {
        app = "wordpress"
    }
  }
  spec {
    port {
      port = 80
      target_port = 80
    }
    selector = {
      app = "wordpress"
      tier = "${kubernetes_replication_controller.wordpress.spec.0.selector.tier}"
    }
    type = "LoadBalancer"
  }
}

resource "kubernetes_persistent_volume_claim" "wordpress" {
  metadata {
    name = "wp-pv-claim"
    labels = {
      app = "wordpress"
    }
  }

  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "20Gi"
      }
    }
  }
}

resource "kubernetes_replication_controller" "wordpress" {
    metadata {
      name = "wordpress"

      labels = {
        app = "wordpress"
      }
    }

    spec {
      selector = {
        app = "wordpress"
        tier = "frontend"
      }

      replicas = "${var.k8s_num_wp_replicas[terraform.workspace]}"

      template {
          container {
            image = "wordpress:4.9.4-php5.6-apache"
            name = "wordpress"

            env {
              name = "WORDPRESS_DB_HOST"
              value = "${google.sql_database_instance.sql_master.ip_address.0.ip_address}"
            }

            env {
               env {
              name = "WORDPRESS_DB_USER"
              value = "${var.sql_user}"
            }
            }
          }
        }
    }

}
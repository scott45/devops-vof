resource "google_sql_database_instance" "vof-scott-final" {
  name             = "vof-master-instance-scott-final"
  region           = "${var.region}"
  database_version = "POSTGRES_9_6"

  settings {
    tier = "${var.db_instance_tier}"

    ip_configuration = {
      ipv4_enabled = true

      authorized_networks = [{
        name  = "all"
        value = "0.0.0.0/0"
      }]
    }
  }
}

resource "google_sql_database" "vof-database" {
  name      = "vof-database-scott-final"
  instance  = "${google_sql_database_instance.vof-scott-final.name}"
  charset   = "UTF8"
  collation = "en_US.UTF8"
}

resource "google_sql_user" "vof_db_user" {
  name     = "${var.db_username}"
  instance = "${google_sql_database_instance.vof-scott-final.name}"
  host     = "${var.vof_host}"
  password = "${var.db_password}"
}

output "vof_db_user_name" {
  value = "${var.db_username}"
}

output "vof_db_user_password" {
  value = "${var.db_password}"
}

output "vof_db_instance_ip" {
  value = "${google_sql_database_instance.vof-scott-final.ip_address.0.ip_address}"
}

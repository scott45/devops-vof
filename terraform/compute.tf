resource "google_compute_backend_service" "website" {
  name = "${var.env_name}-vof-lb"
  description = "the Vof load balancer"
  port_name = "https"
  protocol = "HTTPS"
  enable_cdn = false

  backend {
    group = "${google_compute_instance_group.vof-app-server.self_link}"
  }
}

resource "google_compute_instance_group" "vof-app-server" {
  name = "${var.env_name}-vof-app-server"
  base_instance_name = "vof-app-server"
  zone = "${var.zone}"
}

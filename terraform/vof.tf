# variable "env_name" {
#   type = "string"
# }

# variable "google_project_id" {
#   type = "string"
# }

# variable "ip_cidr_range" {
#   type = "string"
# }

# variable "zone" {
#   type = "string"
# }

# variable "request_path" {
#   type = "string"
# }

# variable "vof_disk_image" {
#   type = "string"
# }

# variable "machine_type" {
#   type = "string"
# }

# variable "vof_disk_size" {
#   type = "string"
# }

# variable "vof_disk_type" {
#   type = "string"
# }

# variable "db_instance_tier" {
#   type    = "string"
#   default = "db-f1-micro"
# }

# variable "vof_host" {
#   type    = "string"
#   default = "105.21.32.62"
# }

# variable "project_id" {
#   type    = "string"
#   default = ""
# }

# variable "db_username" {
#   type    = "string"
#   default = "scotty"
# }

# variable "db_password" {
#   type    = "string"
#   default = "scotty"
# }

# variable "check_interval_sec" {}

# variable "max_instances" {}

# variable "min_instances" {}

# variable "healthy_threshold" {}

# variable "unhealthy_threshold" {}

# variable "timeout_sec" {}

#google_compute_instance which manages a vm instance resource within gce
#unique name and optional description
#networks to attach to the resource, gce currently limited to 1, but you can specify a number of times for multiple networks

resource "google_compute_instance" "vof" {
  name        = "vof-test"
  description = "resource for the vof ruby application"

  # type to be created, possible to define custom machine
  machine_type = "n1-standard-1"
  zone         = "europe-west1-b"

  # scratch disk to attach to the instance. can be specified multiple times for multiple scratch disks 
  boot_disk = {
    initialize_params {
      image = "vof-image-ruby-2017-08-21-124244"
    }
  }

  # internal ip address of the instance (manually or dynamically assigned)
  network_interface {
    # name or self link of network to be attached.. either network or subnetwork must be provided
    network = "default"

    # ip's via which this instance can be accessed via the internet
    # if instance has access config, it will use the given nat_ip address or epheremal ip which is automatically generated if none is provided
    access_config {
      // Ephemeral IP
    }
  }
}

# optional, (servive_account)email, scopes (access_config)nat_ip (attached_disk)source, device name


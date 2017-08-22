#google_compute_instance which manages a vm instance resource within gce
#unique name and optional description
#networks to attach tot he resource, gce currently limited to 1, but you can specify a number of times for multiple networks
#

resource "google_compute_instance" "vof" {
  name        = "vof-test"
  description = "resource for the vof ruby application"

  # type to be created, possible to define custom machine
  machine_type = "n1-standard-1"
  zone         = "europe-west1-b"

  # scratch disk to attach to the instance. can be specified multiple times for multiple scratch disks 
  scratch_disk = {
    image = "vof-image-ruby-2017-08-21-124244"
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


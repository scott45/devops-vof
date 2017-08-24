google_project_id = "vof-testbed-2"

accounts_json = "${file("/Users/fleviankanaiza/DevOps/vof-tested/Testbed.json")}"

region = "europe-west1"

zone = "europe-west1-b"

vof_disk_image = "vof-image-ruby-2017-08-21-124244"

machine_type = "n1-standard-1"

env_name = "development"

ip_cidr_range = "10.0.0.0/24"

max_instances = 2

min_instances = 1

healthy_threshold = 2

unhealthy_threshold = 2

timeout_sec = 2

chech_interval_sec = 1

request_path = "/"

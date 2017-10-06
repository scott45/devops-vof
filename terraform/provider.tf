provider "google" {
  "version"     = "~> 0.1"
  "credentials" = "${file("/Users/scotty/Desktop/desktop issh/Vof/packer/files/cred.json")}"
  "project"     = "vof-testbed-2"
  "region"      = "${var.region}"
}

terraform {
  backend "gcs" {
    bucket      = "vof-scott"
    path        = "mystate/terraform.tfstate"
    project     = "vof-testbed-2"
    credentials = "/Users/scotty/Desktop/vof-terraform-master/cred.json"
  }
}

data "terraform_remote_state" "vof" {
  backend = "gcs"

  config {
    bucket      = "vof-scott"
    path        = "mystate/terraform.tfstate"
    project     = "vof-testbed-2"
    credentials = "/Users/scotty/Desktop/vof-terraform-master/cred.json"
  }
}

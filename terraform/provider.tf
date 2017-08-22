provider "google" {
  "credentials" = "${file("/Users/scotty/Downloads/accounts.json")}"
  "project"     = "vof-testbed-2"
  "region"      = "${var.region}"
}

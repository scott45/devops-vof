variable "region" {
  type    = "string"
  default = "europe-west1"
}

variable "db_instance_tier" {
  type    = "string"
  default = "db-f1-micro"
}

variable "project_id" {
  type    = "string"
  default = "vof-testbed-2"
}

variable "db_username" {
  type    = "string"
  default = "scotty"
}

variable "db_password" {
  type    = "string"
  default = "scotty"
}

variable "credential_file" {
  type    = "string"
  default = "cred.json"
}

variable "vof_host" {
  type    = "string"
  default = "105.21.32.62"
}

variable "zone" {
  type    = "string"
  default = "europe-west1-b"
}

variable "vof_disk_image" {
  type    = "string"
  default = "vof-image-withrubycode-latest-scott-1507129709"
}

variable "machine_type" {
  type    = "string"
  default = "vof-image-withrubycode-latest-scott-1507129709"
}

variable "env_name" {
  type    = "string"
  default = "development"
}

variable "ip_cidr_range" {
  type    = "string"
  default = "10.0.0.0/24"
}

variable "max_instances" {
  type    = "string"
  default = "2"
}

variable "min_instances" {
  type    = "string"
  default = "1"
}

variable "healthy_threshold" {
  type    = "string"
  default = "2"
}

variable "unhealthy_threshold" {
  type    = "string"
  default = "2"
}

variable "timeout_sec" {
  type    = "string"
  default = 1
}

variable "check_interval_sec" {
  type    = "string"
  default = 2
}

variable "request_path" {
  type    = "string"
  default = "/"
}

variable "vof_disk_size" {
  type    = "string"
  default = "20"
}

variable "vof_disk_type" {
  type    = "string"
  default = "pd-ssd"
}

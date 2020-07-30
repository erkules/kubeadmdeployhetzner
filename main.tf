variable "pub_key" {}
variable "pvt_key" {}
variable "ssh_fingerprint" {}
variable "instance_count" { default = 4 }
variable "hcloud_token" {}
variable "server_type" { default = "cx21" }
variable "image" { default = "ubuntu-18.04" }


# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token       = "${var.hcloud_token}"
}

resource "hcloud_server" "node1" {
  name        = "${basename(path.cwd)}${count.index}"
  count       = "${var.instance_count}"
  image       = "${var.image}"
  ssh_keys    = ["k8s"]
  server_type = "${var.server_type}"
}

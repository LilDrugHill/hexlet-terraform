terraform {
  required_version = "1.7.4"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

variable "token" {}
variable "ssh_key" {
  
}

provider "digitalocean" {
    # token = var.do_token
    token = var.token
}

resource "digitalocean_droplet" "web" {
  image  = "ubuntu-20-04-x64"
  name   = "web-1"
  region = "fra1"
  size   = "s-1vcpu-1gb"
  user_data = file("terramino.yaml")
}
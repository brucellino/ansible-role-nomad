packer {
  required_plugins {
    digitalocean = {
      version = ">=v1.1.0"
      source = "github.com/digitalocean/digitalocean"
    }
  }
}

source "digitalocean" "server" {
  image = "ubuntu-20-04-x64"
  region = "ams3"
  size = "s-1vcpu-1gb"
  ssh_username = "root"
  snapshot_name = "nomad-{{timestamp}}"
  droplet_name = "packer-nomad-{{timestamp}}"
}

build {
  sources = ["source.digitalocean.server"]

  provisioner "ansible" {
    playbook_file = "playbook.yml"
    ansible_env_vars = [
      "ANSIBLE_ROLES_PATH=$PWD/../"
    ]
  }
}

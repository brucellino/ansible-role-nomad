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
  snapshot_name = "nomad-server-{{timestamp}}"
  droplet_name = "nomad-server-{{timestamp}}-packer"
  tags = ["nomad", "server", "packer"]

}

source "digitalocean" "client" {
  image = "ubuntu-20-04-x64"
  region = "ams3"
  size = "s-1vcpu-1gb"
  ssh_username = "root"
  snapshot_name = "nomad-client-{{timestamp}}"
  droplet_name = "nomad-client-{{timestamp}}-packer"
  tags = ["nomad", "client", "packer"]
}

build {
  sources = ["source.digitalocean.server"]
  provisioner "ansible" {
    playbook_file = "playbook.yml"
    groups = ["nomad", "servers"]
    ansible_env_vars = [
      "ANSIBLE_ROLES_PATH=../../../"
    ]
  }
}

build {
  sources = ["source.digitalocean.client"]
  provisioner "ansible" {
    playbook_file = "playbook.yml"
    groups = ["nomad", "clients"]
    ansible_env_vars = [
      "ANSIBLE_ROLES_PATH=../../../"
    ]
  }
}

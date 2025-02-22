# Tell terraform to use the provider and select a version.
terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.45"
    }
  }
}


# Set the variable value in *.tfvars file
# or using the -var="hcloud_token=..." CLI option
variable "hcloud_token" {
  sensitive = true
}

# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token = var.hcloud_token
}


resource "hcloud_firewall" "k8s_firewall" {
  name = "k8s-firewall"

  rule {
    description = "Allow SSH port"
    direction = "in"
    protocol  = "tcp"
    port      = "22"
    source_ips = ["0.0.0.0/0"]
  }

  rule {
    description = "Allow ICMP (ping)"
    direction = "in"
    protocol  = "icmp"
    source_ips = ["0.0.0.0/0"]
  }

  rule {
    description = "Allow NodePort range"
    direction = "in"
    protocol  = "tcp"
    port      = "30000-32767"
    source_ips = ["0.0.0.0/0"]
  }

  rule {
    description = "Allow NodePort range UDP"
    direction = "in"
    protocol  = "udp"
    port      = "30000-32767"
    source_ips = ["0.0.0.0/0"]
  }

  rule {
    description = "Allow API access"
    direction = "in"
    protocol  = "tcp"
    port      = "6443"
    source_ips = ["0.0.0.0/0"]
  }

  rule {
    description = "Allow all TCP traffic between nodes"
    direction = "in"
    protocol  = "tcp"
    port      = "any"
    source_ips = ["10.0.0.0/16"]
  }

  rule {
    description = "Allow all UDP traffic between nodes"
    direction = "in"
    protocol  = "udp"
    port      = "any"
    source_ips = ["10.0.0.0/16"]
  }

  rule {
    description = "Allow HTTPS traffic"
    direction = "in"
    protocol  = "tcp"
    port      = "443"
    source_ips = ["0.0.0.0/0"]
  }

  rule {
    description = "Allow HTTP/QUIC traffic"
    direction = "in"
    protocol  = "udp"
    port      = "443"
    source_ips = ["0.0.0.0/0"]
  }
}

resource "hcloud_firewall_attachment" "fw_reference" {
  firewall_id = hcloud_firewall.k8s_firewall.id
  label_selectors = ["cluster=kube"]
}

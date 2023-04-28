resource "digitalocean_droplet" "app" {
  image  = var.image
  name   = var.name
  region = var.region
  size   = var.size
}

output "droplet_ip" {
  value = digitalocean_droplet.app.ipv4_address
}

output "droplet_id" {
  value = digitalocean_droplet.app.id
}

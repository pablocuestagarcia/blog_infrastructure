provider "digitalocean" {
  token = var.do_token
}

module "droplet" {
  source = "../../modules/droplet"
  image  = "docker-18-04"
  name   = "app-droplet"
  region = var.region
  size   = var.size
}

module "domain" {
  source     = "../../modules/domain"
  domain     = var.domain
  subdomain  = var.subdomain
  ip_address = module.droplet.droplet_ip
}

module "firewall" {
  source = "../../modules/firewall"
  name   = "app-firewall"

  droplet_ids = [module.droplet.droplet_id]

  inbound_rules = [
    {
      protocol         = "tcp"
      port_range       = "22"
      source_addresses = var.source_addresses
    },
    {
      protocol         = "tcp"
      port_range       = "80"
      source_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol         = "tcp"
      port_range       = "443"
      source_addresses = ["0.0.0.0/0", "::/0"]
    }
  ]
}

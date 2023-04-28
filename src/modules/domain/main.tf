resource "digitalocean_domain" "domain" {
  name      = var.domain
  ip_address = var.ip_address
}

resource "digitalocean_record" "subdomain" {
  domain = digitalocean_domain.domain.name
  type   = "CNAME"
  name   = var.subdomain
  value  = digitalocean_domain.domain.name
}

output "domain_name" {
  value = digitalocean_domain.domain.name
}

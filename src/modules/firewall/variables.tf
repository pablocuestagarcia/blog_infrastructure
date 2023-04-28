variable "name" {
  description = "El nombre del firewall"
  type        = string
}

variable "droplet_ids" {
  description = "La lista de IDs de los Droplets asociados al firewall"
  type        = list(number)
}

variable "inbound_rules" {
  description = "Las reglas de tráfico entrante para el firewall"
  type = list(object({
    protocol         = string
    port_range       = string
    source_addresses = list(string)
  }))
}

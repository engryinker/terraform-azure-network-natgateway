output "nat_gateways" {
  description = "Map (same keys as var.nat_gateways) of every output from each NAT gateways created -- see upstream module docs for the full shape."
  value       = module.nat_gateway
}

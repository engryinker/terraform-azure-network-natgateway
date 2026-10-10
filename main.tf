data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

module "nat_gateway" {
  source   = "Azure/avm-res-network-natgateway/azurerm"
  version  = "0.3.2"
  for_each = var.nat_gateways

  name                             = each.value.name
  location                         = var.location
  parent_id                        = data.azurerm_resource_group.this.id
  tags                             = coalesce(each.value.tags, var.tags)
  enable_telemetry                 = coalesce(each.value.enable_telemetry, var.enable_telemetry)
  lock                             = each.value.lock
  sku_name                         = each.value.sku_name
  zones                            = each.value.zones
  public_ip_configuration          = each.value.public_ip_configuration
  public_ip_prefix_resource_ids    = each.value.public_ip_prefix_resource_ids
  public_ips                       = each.value.public_ips
  timeouts                         = each.value.timeouts
  public_ip_resource_ids           = each.value.public_ip_resource_ids
  role_assignments                 = each.value.role_assignments
  diagnostic_settings              = each.value.diagnostic_settings
  public_ip_prefix_v6_resource_ids = each.value.public_ip_prefix_v6_resource_ids
  public_ip_v6_resource_ids        = each.value.public_ip_v6_resource_ids
  idle_timeout_in_minutes          = each.value.idle_timeout_in_minutes
}

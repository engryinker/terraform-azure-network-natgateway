variable "resource_group_name" {
  description = "Name of the existing resource group to deploy every resource in this module call into. This module does not create the resource group itself."
  type        = string
}

variable "location" {
  description = "Azure region for every resource created by this module call."
  type        = string
}

variable "tags" {
  description = "Default tags applied to every resource created by this module call (e.g. the output of terraform-azure-tags). Overridden per-resource by that resource's own `tags` attribute, if set."
  type        = map(string)
  default     = {}
}

variable "enable_telemetry" {
  description = "Default AVM telemetry opt-in/out applied to every resource created by this module call. See https://aka.ms/avm/telemetry. Overridden per-resource by that resource's own `enable_telemetry` attribute, if set."
  type        = bool
  default     = true
}

variable "nat_gateways" {
  description = "Map of NAT gateways to create, keyed by an arbitrary caller-chosen map key. Mirrors the inputs of Azure/avm-res-network-natgateway/azurerm v0.3.2 (https://registry.terraform.io/modules/Azure/avm-res-network-natgateway/azurerm/0.3.2) 1:1 -- see upstream docs for the schema of any field typed `any`. `name`, `tags` and `enable_telemetry` (where present upstream) are handled specially by this wrapper; every other field is passed straight through unmodified."
  type = map(object({
    name                             = string
    tags                             = optional(map(string))
    enable_telemetry                 = optional(bool)
    lock                             = optional(any, null)
    sku_name                         = optional(string, null)
    zones                            = optional(set(string), null)
    public_ip_configuration          = optional(any, null)
    public_ip_prefix_resource_ids    = optional(set(string), null)
    public_ips                       = optional(any, null)
    timeouts                         = optional(any, null)
    public_ip_resource_ids           = optional(set(string), null)
    role_assignments                 = optional(any, null)
    diagnostic_settings              = optional(any, null)
    public_ip_prefix_v6_resource_ids = optional(set(string), null)
    public_ip_v6_resource_ids        = optional(set(string), null)
    idle_timeout_in_minutes          = optional(number, null)
  }))
  default = {}
}

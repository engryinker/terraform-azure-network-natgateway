# terraform-azure-network-natgateway

Org-standard Terraform wrapper for: **NAT gateways**.

Deploys into an existing resource group (passed in via `resource_group_name` / `location`) -- this module does not create the resource group itself. Compose with [terraform-azure-naming](https://github.com/<org>/terraform-azure-naming) for names and [terraform-azure-tags](https://github.com/<org>/terraform-azure-tags) for the `tags` input.

## Usage

```hcl
module "network-natgateway" {
  source = "git::https://github.com/<org>/terraform-azure-network-natgateway.git?ref=v1.0.0"

  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  tags                = module.tags.tags

  nat_gateways = {
    example = {
      # see Inputs below -- every field upstream supports, see linked AVM module docs for the full schema
    }
  }
}
```

See [`examples/basic`](examples/basic) for a minimal runnable (zero-instance) example.

## Inputs

Beyond the standard `resource_group_name`, `location`, `tags`, `enable_telemetry` module-level variables, each map variable below mirrors its upstream AVM module's inputs 1:1 (fields typed `any` carry complex nested upstream schemas -- see the linked module docs):

### `nat_gateways` (NAT gateways)

Wraps [Azure/avm-res-network-natgateway/azurerm](https://registry.terraform.io/modules/Azure/avm-res-network-natgateway/azurerm/0.3.2) v0.3.2.

| Field | Type | Required | Notes |
| --- | --- | --- | --- |
| `name` | `string` | yes | Resource name. |
| `lock` | `any` | no |  |
| `sku_name` | `string` | no |  |
| `zones` | `set(string)` | no |  |
| `public_ip_configuration` | `any` | no |  |
| `public_ip_prefix_resource_ids` | `set(string)` | no |  |
| `public_ips` | `any` | no |  |
| `timeouts` | `any` | no |  |
| `public_ip_resource_ids` | `set(string)` | no |  |
| `role_assignments` | `any` | no |  |
| `diagnostic_settings` | `any` | no |  |
| `public_ip_prefix_v6_resource_ids` | `set(string)` | no |  |
| `public_ip_v6_resource_ids` | `set(string)` | no |  |
| `idle_timeout_in_minutes` | `number` | no |  |
| `tags` | `map(string)` | no | Overrides the module-level `tags` for this entry only. |
| `enable_telemetry` | `bool` | no | Overrides the module-level `enable_telemetry` for this entry only. |

## Outputs

- `nat_gateways` -- map (same keys as the input) of every output from each created NAT gateways.

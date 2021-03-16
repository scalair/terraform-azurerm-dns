# terraform-azurerm-dns

Terraform module to manage public or private Azure DNS zone, and DNS records.

Whatever the way you choose to create the DNS zone, you can create and manage records in both **public and private** DNS zone by setting `public_dns_zone` attribute.

You can use this module to manage records of an **existing DNS zone** by setting `create_dns_zone` to `false`.
Or, you can use this module to **create the DNS zone** for you, then manage records within, by setting `create_dns_zone` to `true`.

Anyway, you must set `public_dns_zone` to `true` if you want to manage a private DNS zone, and you must set `public_dns_zone` to `false` if you want to manage a public DNS zone.

## Features

### Create the DNS zone

You can choose to create or not the DNS zone by changing the boolean `create_dns_zone` (default to `true`).
If set to `true`, then it creates the DNS zone with specified records within.
If set to `false`, then it only handle records in the specified DNS zone.

When you choose to create the DNS zone, then you must configure the `soa_record` according to the official [Azure SOA record block](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone#soa_record) from the official Azure DNS zone.

### Manage DNS records

You can manage several DNS records in the specified DNS zone :

- `A` records by manipulating `a_records` variable. Record is based on the official [Azure `A` record resource](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_a_record)
- `AAAA` records by manipulating `aaaa_records` variable. Record is based on the official [Azure `AAAA` record resource](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_aaaa_record)
- `MX` records by manipulating `mx_records` variable. Record is based on the official [Azure `MX` record resource](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_mx_record)
- `SOA` record is a special record and unique for the specified DNS zone. It can be managed only if you also choose to create the DNS zone. Check `Create the DNS zone` paragraph.

## Usage

An example that creates the DNS zone with A and SOA records :

```hcl
module "dns" {}
  source = "github.com/scalair/terraform-azurerm-dns"

  zone_name           = "az.domain.net"
  resource_group_name = "rg-monitoring01"

  create_dns_zone     = true

  a_records   = [
    {
      name    = "www"
      records = ["10.10.10.1"]
      ttl     = 3600
    },
    {
      name    = "myshop"
      records = ["10.10.10.2"]
      ttl     = 3600
    }
  ]

  soa_record = {
    email     = "admin"
    host_name = "ns1-03.azure-dns.com."

    tags = {
      "env"   = "prod"
      "owner" = "scalair"
    }
  }
}
```

An example that creates A records in an existing DNS zone :

```hcl
module "dns" {
  source = "github.com/scalair/terraform-azurerm-dns"

  zone_name           = "az.domain.net"
  resource_group_name = "rg-monitoring01"

  create_dns_zone     = false

  a_records   = [
    {
      name    = "www"
      records = ["10.10.10.1"]
      ttl     = 3600
    },
    {
      name    = "myshop"
      records = ["10.10.10.2"]
      ttl     = 3600
    }
  ]
}
```

An example that creates the DNS zone, then create MX records for it :

```hcl
module "dns" {
  source = "github.com/scalair/terraform-azurerm-dns"

  zone_name           = "az.domain.net"
  resource_group_name = "rg-monitoring01"

  create_dns_zone     = true

  mx_records   = {
    name    = "mail"
    ttl     = 3600
    records = [
      {
        preference  = 10,
        exchange    = "mail1.contoso.com"
      },
      {
        preference  = 20,
        exchange    = "mail2.contoso.com"
      }
    ]
  }
}
```

## Contribute

You can contribute by adding support for :

- any DNS records that is not yet implemented.
- `soa_record` block in public and private DNS zone.
- any other ideas are welcome ;)

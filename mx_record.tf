resource "azurerm_private_dns_mx_record" "mx_record_private_with_zone" {
  count               = var.mx_records == {} ? 0 : (var.create_dns_zone ? (var.public_dns_zone ? 0 : 1) : 0)

  zone_name           = var.zone_name
  resource_group_name = var.resource_group_name

  name                = var.mx_records.name
  ttl                 = lookup(var.mx_records, "ttl", 3600)

  dynamic "record" {
    for_each          = lookup(var.mx_records, "records", {})

    content {
      preference        = record.value.preference
      exchange          = record.value.exchange
    }
  }

  depends_on = [ azurerm_private_dns_zone.zone_private ]
}

resource "azurerm_dns_mx_record" "mx_record_public_with_zone" {
  count               = var.mx_records == {} ? 0 : (var.create_dns_zone ? (var.public_dns_zone ? 1 : 0) : 0)

  zone_name           = var.zone_name
  resource_group_name = var.resource_group_name

  name                = var.mx_records.name
  ttl                 = lookup(var.mx_records, "ttl", 3600)

  dynamic "record" {
    for_each          = lookup(var.mx_records, "records", {})

    content {
      preference        = record.value.preference
      exchange          = record.value.exchange
    }
  }

  depends_on = [ azurerm_dns_zone.zone_public ]
}

resource "azurerm_private_dns_mx_record" "mx_record_private_no_zone" {
  count               = var.mx_records == {} ? 0 : (var.create_dns_zone ? 0 : (var.public_dns_zone ? 0 : 1))

  zone_name           = var.zone_name
  resource_group_name = var.resource_group_name

  name                = var.mx_records.name
  ttl                 = lookup(var.mx_records, "ttl", 3600)

  dynamic "record" {
    for_each          = lookup(var.mx_records, "records", {})

    content {
      preference        = record.value.preference
      exchange          = record.value.exchange
    }
  }
}

resource "azurerm_dns_mx_record" "mx_record_public_no_zone" {
  count               = var.mx_records == {} ? 0 : (var.create_dns_zone ? 0 : (var.public_dns_zone ? 1 : 0))

  zone_name           = var.zone_name
  resource_group_name = var.resource_group_name

  name                = var.mx_records.name
  ttl                 = lookup(var.mx_records, "ttl", 3600)

  dynamic "record" {
    for_each          = lookup(var.mx_records, "records", {})

    content {
      preference        = record.value.preference
      exchange          = record.value.exchange
    }
  }
}

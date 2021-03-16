terraform {
  required_version = ">= 0.13.0"
}

resource "azurerm_dns_zone" "zone_public" {
  count               = var.create_dns_zone ? (var.public_dns_zone ? 1 : 0) : 0

  name                = var.zone_name
  resource_group_name = var.resource_group_name

  tags  = var.zone_tags
}

resource "azurerm_private_dns_zone" "zone_private" {
  count               = var.create_dns_zone ? (var.public_dns_zone ? 0 : 1) : 0

  name                = var.zone_name
  resource_group_name = var.resource_group_name

  tags  = var.zone_tags
}

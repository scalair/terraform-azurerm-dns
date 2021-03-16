output "zone_id" {
  description = "The DNS Zone ID."
  value       = var.create_dns_zone ? (var.public_dns_zone ? azurerm_dns_zone.zone_public.0.id : azurerm_private_dns_zone.zone_private.0.id) : null
}

output "zone_max_number_of_record_sets" {
  description = "Maximum number of Records in the zone."
  value       = var.create_dns_zone ? (var.public_dns_zone ? azurerm_dns_zone.zone_public.0.max_number_of_record_sets : azurerm_private_dns_zone.zone_private.0.max_number_of_record_sets) : null
}

output "zone_number_of_record_sets" {
  description = "The number of records already in the zone."
  value       = var.create_dns_zone ? (var.public_dns_zone ? azurerm_dns_zone.zone_public.0.number_of_record_sets : azurerm_private_dns_zone.zone_private.0.number_of_record_sets) : null
}

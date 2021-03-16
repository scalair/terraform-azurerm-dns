output "zone_id" {
  description   = "The DNS Zone ID."
  value         = var.create_dns_zone ? (var.public_dns_zone ? azurerm_dns_zone.zone_public.0.id : azurerm_private_dns_zone.zone_private.0.id) : null
}

output "zone_max_number_of_record_sets" {
  description   = "Maximum number of Records in the zone."
  value         = var.create_dns_zone ? (var.public_dns_zone ? azurerm_dns_zone.zone_public.0.max_number_of_record_sets : azurerm_private_dns_zone.zone_private.0.max_number_of_record_sets) : null
}

output "zone_number_of_record_sets" {
  description   = "The number of records already in the zone."
  value         = var.create_dns_zone ? (var.public_dns_zone ? azurerm_dns_zone.zone_public.0.number_of_record_sets : azurerm_private_dns_zone.zone_private.0.number_of_record_sets) : null
}

output "a_record_id" {
  description   = "A list of DNS A Record ID."
  value         =  var.create_dns_zone ? (var.public_dns_zone ? azurerm_dns_a_record.a_record_public_with_zone.*.id : azurerm_private_dns_a_record.a_record_private_with_zone.*.id) : (var.public_dns_zone ? azurerm_dns_a_record.a_record_public_no_zone.*.id : azurerm_private_dns_a_record.a_record_private_no_zone.*.id)
}

output "a_record_fqdn" {
  description   = "A list of DNS A Record FQDN."
  value         =  var.create_dns_zone ? (var.public_dns_zone ? azurerm_dns_a_record.a_record_public_with_zone.*.fqdn : azurerm_private_dns_a_record.a_record_private_with_zone.*.fqdn) : (var.public_dns_zone ? azurerm_dns_a_record.a_record_public_no_zone.*.fqdn : azurerm_private_dns_a_record.a_record_private_no_zone.*.fqdn)
}

output "aaaa_record_id" {
  description   = "A list of DNS AAAA Record ID."
  value         =  var.create_dns_zone ? (var.public_dns_zone ? azurerm_dns_aaaa_record.aaaa_record_public_with_zone.*.id : azurerm_private_dns_aaaa_record.aaaa_record_private_with_zone.*.id) : (var.public_dns_zone ? azurerm_dns_aaaa_record.aaaa_record_public_no_zone.*.id : azurerm_private_dns_aaaa_record.aaaa_record_private_no_zone.*.id)
}

output "aaaa_record_fqdn" {
  description   = "A list of DNS AAAA Record FQDN."
  value         =  var.create_dns_zone ? (var.public_dns_zone ? azurerm_dns_aaaa_record.aaaa_record_public_with_zone.*.fqdn : azurerm_private_dns_aaaa_record.aaaa_record_private_with_zone.*.fqdn) : (var.public_dns_zone ? azurerm_dns_aaaa_record.aaaa_record_public_no_zone.*.fqdn : azurerm_private_dns_aaaa_record.aaaa_record_private_no_zone.*.fqdn)
}

output "mx_record_id" {
  description   = "A list of DNS MX Record ID."
  value         =  var.create_dns_zone ? (var.public_dns_zone ? azurerm_dns_mx_record.mx_record_public_with_zone.*.id : azurerm_private_dns_mx_record.mx_record_private_with_zone.*.id) : (var.public_dns_zone ? azurerm_dns_mx_record.mx_record_public_no_zone.*.id : azurerm_private_dns_mx_record.mx_record_private_no_zone.*.id)
}

output "mx_record_fqdn" {
  description   = "A list of DNS MX Record FQDN."
  value         =  var.create_dns_zone ? (var.public_dns_zone ? azurerm_dns_mx_record.mx_record_public_with_zone.*.fqdn : azurerm_private_dns_mx_record.mx_record_private_with_zone.*.fqdn) : (var.public_dns_zone ? azurerm_dns_mx_record.mx_record_public_no_zone.*.fqdn : azurerm_private_dns_mx_record.mx_record_private_no_zone.*.fqdn)
}

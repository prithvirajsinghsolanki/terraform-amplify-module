# # AWS Current Region
# output "aws_current_region" {
#   value = data.aws_region.current

# }

# # Amplify

output "amplify_default_appdomain" {
  value       =  aws_amplify_app.app.default_domain
  description = "The default domain of Amplify App."
}

output "amplify_custom_appdomain" {
  value       =  aws_amplify_domain_association.app-domain.domain_name
  description = "The custom domain of Amplify App."
}

output "amplify_custom_domain_verification_dns_record" {
  value       =  aws_amplify_domain_association.app-domain.certificate_verification_dns_record
  description = "The custom domain association verification record."
}

# # AWS Current Region
# output "aws_current_region" {
#   value = "AWS Region: ${module.sample-qs.aws_current_region.name}"
# }

# # Amplify

output "amplify_default_appdomain" {
  value       = "https://${module.amplify-app.amplify_default_appdomain}"
  description = "The default domain of Amplify App"
}

output "amplify_custom_domain_association" {
  value       =  module.amplify-app.amplify_custom_appdomain
  description = "The custom domain of Amplify App"
}

output "amplify_custom_domain_verification_dns_record" {
  value       = module.amplify-app.amplify_custom_domain_verification_dns_record
  description = "The custom domain association verification record."
}

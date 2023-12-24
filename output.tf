output "cf_arn" {
  description = "The ARN of the CloudFront distribution"
  value       = aws_cloudfront_distribution.main.arn
}

output "cf_domain_name" {
  description = "The domain name corresponding to the CloudFront distribution"
  value       = aws_cloudfront_distribution.main.domain_name
}

output "cf_etag" {
  description = "The current version of the CloudFront distribution's information"
  value       = aws_cloudfront_distribution.main.etag
}

output "cf_status" {
  description = "The current status of the distribution"
  value       = aws_cloudfront_distribution.main.status
}

# output "s3" {
#     value = aws_s3_bucket.s3_bucket
# }
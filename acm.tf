resource "aws_acm_certificate" "acm_cert" {
  domain_name = var.route53_domain
  subject_alternative_names = [
    local.s3_bucket_name
  ]

  validation_method = "DNS"

}

resource "aws_acm_certificate_validation" "cert_validate" {
  certificate_arn         = aws_acm_certificate.acm_cert.arn
  validation_record_fqdns = [for record in aws_route53_record.record_acm_cert : record.fqdn]
}
data "aws_cloudfront_cache_policy" "cache-optimized" {
  name = "Managed-CachingDisabled" # "Managed-CachingOptimized"
}

resource "aws_cloudfront_origin_access_control" "cloudfront-oac" {
  name                              = "cloudfront-oac-bucket"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "main" {
  http_version = "http2"

  origin {
    domain_name = "websitedemo.crosscloudx.com.s3.us-east-1.amazonaws.com"
    origin_access_control_id = aws_cloudfront_origin_access_control.cloudfront-oac.id
    origin_id = "origin-${local.s3_bucket_name}"
  }

  enabled             = true
  default_root_object = var.index_document

  aliases = concat([local.s3_bucket_name])

  price_class = "PriceClass_100"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  default_cache_behavior {
    target_origin_id = "origin-${local.s3_bucket_name}"
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    compress         = true
    cache_policy_id  = data.aws_cloudfront_cache_policy.cache-optimized.id
    viewer_protocol_policy = "redirect-to-https"
  }

  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate_validation.cert_validate.certificate_arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }
}
data "aws_caller_identity" "current" {}

locals {
  s3_bucket_name = "${var.s3_bucket_name}.${var.route53_domain}"
  aws_account_id = data.aws_caller_identity.current.account_id
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = local.s3_bucket_name

  force_destroy = var.s3_force_destroy

  tags = {
    "Name" = local.s3_bucket_name
  }
}


# resource "aws_s3_bucket_website_configuration" "s3_website" {
#   bucket = aws_s3_bucket.s3_bucket.id

#   index_document {
#     suffix = var.index_document
#   }

#   error_document {
#     key = var.error_document
#   }
# }

resource "aws_s3_bucket_policy" "s3_bucket_policy_attach" {
  bucket = aws_s3_bucket.s3_bucket.id
  policy = data.aws_iam_policy_document.bucket_policy.json
}

data "aws_iam_policy_document" "bucket_policy" {
  statement {
    sid    = "AllowCloudFrontServicePrincipal"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    actions   = ["s3:GetObject"]
    resources = ["arn:aws:s3:::${local.s3_bucket_name}/*"]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"

      values = [aws_cloudfront_distribution.main.arn]
    }
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "s3_lifecycle" {
  bucket = aws_s3_bucket.s3_bucket.id
  rule {
    id = "rule-versioning"
    noncurrent_version_expiration {
      noncurrent_days           = 90
      newer_noncurrent_versions = 30
    }
    status = "Enabled"
  }
}

resource "aws_s3_object" "website_files" {
  for_each     = fileset("src/", "**/*.*")
  bucket       = aws_s3_bucket.s3_bucket.id
  key          = each.value
  source       = "src/${each.value}"
  etag         = filemd5("src/${each.value}")
  content_type = lookup(var.mime_types, split(".", each.value)[1])
}
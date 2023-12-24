variable "env" {
  default = ""
}

variable "tf_version" {
  default = ""
}

variable "cost" {
  default = ""
}

variable "project" {
  default = ""
}

variable "s3_bucket_name" {
  default = ""
}

variable "route53_domain" {
  default = ""
}

variable "s3_force_destroy" {
  default = true
}

variable "secret_user_agent" {
  type        = string
  description = "Secret to authenticate Cloudfront requests to S3"
  default     = "SECRET-STRING"
}

variable "index_document" {
  type        = string
  description = "Index page to be used for website."
  default     = "index.html"
}

variable "error_document" {
  type        = string
  description = "Error page to be used for website."
  default     = "error.html"
}


variable "mime_types" {
  default = {
    htm  = "text/html"
    html = "text/html"
    css  = "text/css"
    ttf  = "font/ttf"
    js   = "application/javascript"
    map  = "application/javascript"
    json = "application/json"
    jpeg = "image/jpeg"
    jpg  = "image/jpeg"
  }
}
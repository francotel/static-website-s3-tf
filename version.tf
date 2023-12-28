terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.6.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.0"
    }
  }
  backend "s3" {}
  
  # backend "s3" {
  #   bucket         = ""
  #   dynamodb_table = ""
  #   key            = ""
  #   region         = ""
  #   encrypt        = true
  # }

}
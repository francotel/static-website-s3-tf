provider "aws" {
  profile = "scc-aws"
  region  = "us-east-1"

  default_tags {
    tags = {
      ManagedBy = "Terraform"
      Env       = var.env
      TFVersion = var.tf_version
      Cost      = var.cost
      Project   = var.project
    }
  }
}
provider "aws" {
  region = "eu-central-1"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "my-terraform-state-bucket"
  acl    = "private"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    id      = "Keep last 30 versions"
    enabled = true

    noncurrent_version_expiration {
      days = 30
    }
  }
}
